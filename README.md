# **Katoolin3 Installation Script for Barebone Ubuntu**

## **Description**
This script automates the installation of [Katoolin3](https://github.com/s-h-3-l-l/katoolin3), a tool to access and manage Kali Linux tools on Ubuntu-based systems.

## **Usage**
1. **Download the script (or clone the repo)**:
   ```bash
   wget https://github.com/macdoos/katoolin3/blob/main/install.sh
   ```

2. **Make it executable**:
   ```bash
   chmod +x install.sh
   ```

3. **Run the script**:
   ```bash
   sudo ./install.sh
   ```

## **What It Does**
- Updates and upgrades the system.
- Installs required dependencies (`git`, `python3`, `python3-apt`, etc.).
- Clones the Katoolin3 repository.
- Runs the installation.
- Configures Katoolin3 to run globally.

## **Run Katoolin3**
```bash
sudo katoolin3
```

## **Uninstall**
To remove Katoolin3:
```bash
cd katoolin3
chmod +x uninstall.sh
sudo ./uninstall.sh
```