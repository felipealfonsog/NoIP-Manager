#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CONFIG_FILE "/home/felipe/.noip_duc_config"
#define PID_FILE "/tmp/noip_duc.pid"

// Function prototypes
void load_config();
void save_config();
void start_noip();
void stop_noip();
void status_noip();
void update_domain();
void setup_account();
void toggle_daemon_mode();
void get_current_ip();
void print_menu();

// Global variables
char username[100];
char password[100];
char domains[200];
int run_as_daemon = 1; // 1 for yes, 0 for no

int main() {
    int option;

    load_config();

    while (1) {
        print_menu();
        printf("Choose an option: ");
        scanf("%d", &option);

        switch (option) {
            case 1: start_noip(); break;
            case 2: stop_noip(); break;
            case 3: status_noip(); break;
            case 4: update_domain(); break;
            case 5: setup_account(); break;
            case 6: toggle_daemon_mode(); break;
            case 7: get_current_ip(); break;
            case 8: exit(0);
            default: printf("Invalid option. Please choose a valid option.\n");
        }
    }

    return 0;
}

void print_menu() {
    printf("==============================\n");
    printf(" No-IP Dynamic Update Client \n");
    printf("==============================\n");
    printf("1) Start No-IP Client\n");
    printf("2) Stop No-IP Client\n");
    printf("3) Check No-IP Client Status\n");
    printf("4) Update a Domain\n");
    printf("5) Setup No-IP Account\n");
    printf("6) Toggle Daemon Mode (Currently: %s)\n", run_as_daemon ? "yes" : "no");
    printf("7) Check IP Address\n");
    printf("8) Exit\n");
    printf("==============================\n");
}

void load_config() {
    FILE *file = fopen(CONFIG_FILE, "r");
    if (file) {
        fscanf(file, "USERNAME=\"%[^\"]\"\n", username);
        fscanf(file, "PASSWORD=\"%[^\"]\"\n", password);
        fscanf(file, "RUN_AS_DAEMON=\"%d\"\n", &run_as_daemon);
        fscanf(file, "DOMAINS=\"%[^\"]\"\n", domains);
        fclose(file);
    } else {
        printf("No configuration file found. Starting setup.\n");
        setup_account();
    }
}

void save_config() {
    FILE *file = fopen(CONFIG_FILE, "w");
    if (file) {
        fprintf(file, "USERNAME=\"%s\"\n", username);
        fprintf(file, "PASSWORD=\"%s\"\n", password);
        fprintf(file, "RUN_AS_DAEMON=\"%d\"\n", run_as_daemon);
        fprintf(file, "DOMAINS=\"%s\"\n", domains);
        fclose(file);
    }
}

void start_noip() {
    char command[500];
    snprintf(command, sizeof(command), "noip-duc --username \"%s\" --password \"%s\" --check-interval 5m --hostnames \"%s\" %s",
             username, password, domains, run_as_daemon ? "--daemonize --daemon-pid-file " PID_FILE : "& echo $! > " PID_FILE);
    system(command);
    printf("No-IP client started successfully.\n");
}

void stop_noip() {
    char command[100];
    snprintf(command, sizeof(command), "cat " PID_FILE);
    FILE *fp = popen(command, "r");
    if (!fp) {
        printf("Failed to read PID file.\n");
        return;
    }

    int pid;
    if (fscanf(fp, "%d", &pid) != 1) {
        printf("Failed to read PID.\n");
        pclose(fp);
        return;
    }
    pclose(fp);

    snprintf(command, sizeof(command), "kill %d", pid);
    system(command);
    printf("No-IP client stopped successfully.\n");
    remove(PID_FILE);
}

void status_noip() {
    char command[100];
    snprintf(command, sizeof(command), "if ps -p $(cat " PID_FILE ") > /dev/null; then echo \"No-IP client is running.\"; else echo \"No-IP client is not running.\"; fi");
    system(command);
}

void update_domain() {
    char domain[200];
    printf("Enter the domain you want to update: ");
    scanf("%s", domain);
    char command[500];
    snprintf(command, sizeof(command), "noip-duc --username \"%s\" --password \"%s\" --hostnames \"%s\" --once", username, password, domain);
    system(command);
    printf("Domain %s updated successfully.\n", domain);
}

void setup_account() {
    printf("Enter your No-IP username: ");
    scanf("%s", username);
    printf("Enter your No-IP password: ");
    scanf("%s", password);
    printf("Do you want to run the No-IP client as a daemon? (1 for yes, 0 for no): ");
    scanf("%d", &run_as_daemon);
    printf("Enter your domain(s) (separated by space): ");
    scanf("%s", domains);
    save_config();
    printf("Configuration updated and saved to %s.\n", CONFIG_FILE);
}

void toggle_daemon_mode() {
    run_as_daemon = !run_as_daemon;
    save_config();
    printf("Daemon mode toggled. Configuration updated and saved to %s.\n", CONFIG_FILE);
}

void get_current_ip() {
    char command[] = "curl -s ifconfig.me";
    FILE *fp = popen(command, "r");
    if (fp) {
        char ip[100];
        if (fgets(ip, sizeof(ip), fp) != NULL) {
            printf("Current IP Address: %s", ip);
        } else {
            printf("Unable to retrieve current IP address.\n");
        }
        pclose(fp);
    } else {
        printf("Unable to retrieve current IP address.\n");
    }
}

