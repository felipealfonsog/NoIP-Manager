# NoIP-Manager*
A versatile tool for managing No-IP dynamic DNS updates and client operations.

NoIP Manager is a comprehensive utility designed for managing No-IP dynamic DNS updates and client operations. This project provides a flexible and cross-platform solution, allowing users to start, stop, and configure the No-IP Dynamic Update Client. With support for both graphical and command-line interfaces, NoIP Manager facilitates easy interaction with No-IP services, including updating DNS records and checking the status of the client. The project features multiple implementations across different programming languages, ensuring compatibility with various systems and user preferences.

[![Arch Linux AUR](https://img.shields.io/badge/Arch_Linux_AUR-yes-brightgreen)](https://github.com/felipealfonsog/NoIP-Manager?tab=readme-ov-file#via-aur-using-yay)

<sub>* This is currently an experimental phase where the primary focus is on making the system functional and establishing a practical and logical pathway that aligns with both my vision and the project's goals. It might contain errors, bugs, etc. Many other non-core elements of the project are considered secondary.</sub>

![Version](https://img.shields.io/github/release/felipealfonsog/NoIP-Manager.svg?style=flat&color=blue)
![Main Language](https://img.shields.io/github/languages/top/felipealfonsog/NoIP-Manager.svg?style=flat&color=blue)
[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/Naereen/badges/)


[![BSD 3-Clause License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

<!--
[![GPL license](https://img.shields.io/badge/License-GPL-blue.svg)](http://perso.crans.org/besson/LICENSE.html)
-->

[![Vim](https://img.shields.io/badge/--019733?logo=vim)](https://www.vim.org/)
[![Visual Studio Code](https://img.shields.io/badge/--007ACC?logo=visual-studio-code&logoColor=ffffff)](https://code.visualstudio.com/)







#

#### Screenshots*

[![View Screenshots](https://img.shields.io/badge/View-Screenshots-green)](#)

<sub>*Under Development</sub>

<!-- 
#### Screenshot Linux

<p align="center">
  <img src="./images/novanav-cpp/sshot-linux-novanav-cpp.png" alt="Screenshot Linux" width="400" height="350">
</p>

<p align="center">
  <img src="./images/novanav-cpp/sshot-linux-novanav-cpp_2.png" alt="Screenshot Linux" width="400" height="350">
</p>


#### Screenshot macOS

<p align="center">
  <img src="./images/macos/sshot-2.png" alt="Screenshot macOS" width="400" height="350">
</p>

-->


#

#### Bash Installer 🚀 for Linux (Arch and Debian) - macOS*

[![Bash Installer Version](https://img.shields.io/badge/Bash%20Installer%20Version-Available-brightgreen)](#)

#### To Install it: 

To install NoIP Manager, simply run the installer script available [here](https://github.com/felipealfonsog/NoIP-Manager/raw/main/installer.sh).

Or just Copy - Paste in your terminal and use -curl- to start downloading the installer:

   ```
   curl -O https://raw.githubusercontent.com/felipealfonsog/NoIP-Manager/main/installer.sh
   ```

If you want to use -wget- just copy/paste this line:

   ```
   wget https://github.com/felipealfonsog/NoIP-Manager/raw/main/installer.sh
   ```

   On macOS to download - wget - just install it with Homebrew:

   ```
   brew install wget
   ```

#### Important note when installing:

If you encounter issues executing the file in the terminal, like this message "-bash: ./installer.sh: Permission denied", follow these simple steps to fix it:

1. Open your terminal.
2. Navigate to the directory where the installer script is located using the `cd` command.
3. Run the following command to grant execute permission to the installer script:

   ```
   chmod +x installer.sh
   ```
   
4. Now you can run the installer without any problems.

   ```
   ./installer.sh
   ```
   NOTE: The script will ask for -sudo permissions-. Just simply type in macOS your macOS user password, and in Linux your -sudo- password.

Now type 'noipconf' in the terminal and enjoy using NoIP-Manager! 😊🚀

***If you're using Arch Linux, you can find NoIP-Manager in your program menu!.***

Feel free to reach out if you need any further assistance!

#### Updating with the script: 

If you want to update NoIP-Manager (noipconf) in your system, re-run the script:

   ```
   ./installer.sh
   ```
Please note that if you encounter any issues or have suggestions, feel free to raise an issue on the [NoIP-Manager repository](https://github.com/felipealfonsog/NoIP-Manager/issues). Your feedback is invaluable!

Thank you for joining me on this journey, and I hope it brings value to your life and workflow. Let's continue making technology accessible and enjoyable for everyone!

<sub>* on macOS version might contain lots of errors, bugs, etc.</sub>


#

#### Uninstaller: 

If you want to remove the program, just run the script:

   ```
   curl -O https://raw.githubusercontent.com/felipealfonsog/NoIP-Manager/main/uninstaller.sh
   ```

   ```
   chmod +x uninstaller.sh
   ./uninstaller.sh
   ```

<sub>* on macOS version might contain some errors, bugs, etc.</sub>


#

#### Installation
#### Via AUR using YAY*

[![NoIP Manager](https://img.shields.io/badge/NoIP%20Manager-EE6352)](#)

[![AUR](https://img.shields.io/aur/version/noipconf)](https://aur.archlinux.org/packages/noipconf)

<!-- 
[![AUR](https://img.shields.io/aur/version/noipconf.svg)](https://aur.archlinux.org/packages/noipconf)


https://aur.archlinux.org/packages/noipconf
-->

NoIP Manager is available on AUR (Arch User Repository), and it can be installed using the `yay` package manager. Follow the steps below to install NoIP Manager:

1. Make sure you have `yay` installed. If not, you can install it with the following command:
   
   ```
   sudo pacman -S yay
   ```
   
   Once yay is installed, you can install by running the following command:
   
   ```
   yay -S noipconf
   ```

This command will automatically fetch the package from AUR and handle the installation process for you.
To run the program type 'noip-admin' in the terminal.


#


#### 🌟 Contact the Creator and Engineer Behind This Project



👨‍💻 **Felipe Alfonso González**  
📧 Email: [f.alfonso@res-ear.ch](mailto:f.alfonso@res-ear.ch)  
🐦 x (Twitter): [@felipealfonsog](https://twitter.com/felipealfonsog)  
🔗 GitHub: [felipealfonsog](https://github.com/felipealfonsog)  
📄 License: BSD 3-Clause  


#

#### 🤝 Support and Contributions

If you find this project helpful and would like to support its development, there are several ways you can contribute:

- **Code Contributions**: If you're a developer, you can contribute by submitting pull requests with bug fixes, new features, or improvements. Feel free to fork the project (development branch) and create your own branch to work on.
- **Bug Reports and Feedback**: If you encounter any issues or have suggestions for improvement, please open an issue on the project's GitHub repository. Your feedback is valuable in making the project better.
- **Documentation**: Improving the documentation is always appreciated. If you find any gaps or have suggestions to enhance the project's documentation, please let me know.

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-%E2%98%95-FFDD00?style=flat-square&logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/felipealfonsog)
[![PayPal](https://img.shields.io/badge/Donate%20with-PayPal-00457C?style=flat-square&logo=paypal&logoColor=white)](https://www.paypal.me/felipealfonsog)
[![GitHub Sponsors](https://img.shields.io/badge/Sponsor%20me%20on-GitHub-%23EA4AAA?style=flat-square&logo=github-sponsors&logoColor=white)](https://github.com/sponsors/felipealfonsog)

Your support and contributions are greatly appreciated! Thank you for your help in making this project better. If you need to mail me, this is the way: f.alfonso@res-ear.ch (I'm Felipe, the Computer Science Engineer behind this idea. Cheers!)


#### 📄 License

This project is licensed under the [BSD 3-Clause License](LICENSE). It will have some restrictions, ask about it.


