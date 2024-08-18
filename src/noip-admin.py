import sys
import subprocess
from PyQt5.QtWidgets import QApplication, QMainWindow, QPushButton, QVBoxLayout, QWidget, QLabel, QLineEdit, QMessageBox, QComboBox

class NoIPAdmin(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("No-IP Dynamic Update Client")
        self.setGeometry(100, 100, 400, 300)
        self.initUI()
    
    def initUI(self):
        layout = QVBoxLayout()

        self.status_label = QLabel("No-IP Client Status: Not Running", self)
        layout.addWidget(self.status_label)

        self.ip_label = QLabel("Current IP Address: N/A", self)
        layout.addWidget(self.ip_label)

        self.username_input = QLineEdit(self)
        self.username_input.setPlaceholderText("Enter No-IP Username")
        layout.addWidget(self.username_input)

        self.password_input = QLineEdit(self)
        self.password_input.setPlaceholderText("Enter No-IP Password")
        self.password_input.setEchoMode(QLineEdit.Password)
        layout.addWidget(self.password_input)

        self.domain_input = QLineEdit(self)
        self.domain_input.setPlaceholderText("Enter Domain to Update")
        layout.addWidget(self.domain_input)

        self.start_button = QPushButton("Start No-IP Client", self)
        self.start_button.clicked.connect(self.start_client)
        layout.addWidget(self.start_button)

        self.stop_button = QPushButton("Stop No-IP Client", self)
        self.stop_button.clicked.connect(self.stop_client)
        layout.addWidget(self.stop_button)

        self.status_button = QPushButton("Check No-IP Client Status", self)
        self.status_button.clicked.connect(self.check_status)
        layout.addWidget(self.status_button)

        self.update_button = QPushButton("Update Domain", self)
        self.update_button.clicked.connect(self.update_domain)
        layout.addWidget(self.update_button)

        self.daemon_button = QPushButton("Toggle Daemon Mode", self)
        self.daemon_button.clicked.connect(self.toggle_daemon)
        layout.addWidget(self.daemon_button)

        self.ip_button = QPushButton("Check IP Address", self)
        self.ip_button.clicked.connect(self.check_ip)
        layout.addWidget(self.ip_button)

        self.exit_button = QPushButton("Exit", self)
        self.exit_button.clicked.connect(self.close)
        layout.addWidget(self.exit_button)

        container = QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)

    def run_command(self, command):
        try:
            result = subprocess.run(command, shell=True, text=True, capture_output=True)
            return result.stdout.strip(), result.stderr.strip()
        except Exception as e:
            return "", str(e)

    def start_client(self):
        username = self.username_input.text()
        password = self.password_input.text()
        command = f"noip-duc --username {username} --password {password} --daemonize"
        stdout, stderr = self.run_command(command)
        if stderr:
            QMessageBox.critical(self, "Error", f"Failed to start No-IP client:\n{stderr}")
        else:
            self.status_label.setText("No-IP Client Status: Running")
            QMessageBox.information(self, "Success", "No-IP client started successfully.")

    def stop_client(self):
        command = "pkill noip-duc"
        stdout, stderr = self.run_command(command)
        if stderr:
            QMessageBox.critical(self, "Error", f"Failed to stop No-IP client:\n{stderr}")
        else:
            self.status_label.setText("No-IP Client Status: Not Running")
            QMessageBox.information(self, "Success", "No-IP client stopped successfully.")

    def check_status(self):
        command = "pgrep noip-duc"
        stdout, stderr = self.run_command(command)
        if stdout:
            self.status_label.setText("No-IP Client Status: Running")
        else:
            self.status_label.setText("No-IP Client Status: Not Running")

    def update_domain(self):
        domain = self.domain_input.text()
        username = self.username_input.text()
        password = self.password_input.text()
        command = f"noip-duc --username {username} --password {password} --once --hostnames {domain}"
        stdout, stderr = self.run_command(command)
        if stderr:
            QMessageBox.critical(self, "Error", f"Failed to update domain:\n{stderr}")
        else:
            QMessageBox.information(self, "Success", f"Domain {domain} updated successfully.")

    def toggle_daemon(self):
        command = "pgrep noip-duc > /dev/null && echo 'yes' || echo 'no'"
        stdout, stderr = self.run_command(command)
        if stderr:
            QMessageBox.critical(self, "Error", f"Failed to toggle daemon mode:\n{stderr}")
        else:
            if stdout.strip() == "yes":
                QMessageBox.information(self, "Daemon Mode", "Daemon mode is currently enabled.")
            else:
                QMessageBox.information(self, "Daemon Mode", "Daemon mode is currently disabled.")

    def check_ip(self):
        command = "noip-duc --username {} --password {} --once".format(self.username_input.text(), self.password_input.text())
        stdout, stderr = self.run_command(command)
        if stderr:
            QMessageBox.critical(self, "Error", f"Unable to retrieve current IP address:\n{stderr}")
        else:
            ip = stdout.split("got new ip; ip=")[-1].split(",")[0].strip()
            self.ip_label.setText(f"Current IP Address: {ip}")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = NoIPAdmin()
    window.show()
    sys.exit(app.exec_())

