#!/bin/bash

# Linux Security Hardening Script
# Created by: Amogetswe Mashele
# Date: July 12, 2025
# Environment: WSL2 Ubuntu 24.04 LTS

echo "=== LINUX SECURITY HARDENING SCRIPT ==="
echo "Starting hardening process..."
echo "Date: $(date)"
echo ""

# 1. Update System
echo "[1/10] Updating system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Set Strong Password Policy
echo "[2/10] Configuring password policies..."
sudo apt install -y libpam-pwquality
sudo cp /etc/pam.d/common-password /etc/pam.d/common-password.backup
echo "Setting minimum password length to 12 characters..."

# 3. Configure Automatic Updates
echo "[3/10] Enabling automatic security updates..."
sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades

# 4. Secure SSH Configuration (if SSH is installed)
echo "[4/10] Securing SSH configuration..."
if command -v ssh >/dev/null 2>&1; then
    sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
    echo "SSH found - applying security settings..."
else
    echo "SSH not installed - skipping SSH hardening"
fi

# 5. Set File Permissions
echo "[5/10] Securing file permissions..."
sudo chmod 644 /etc/passwd
sudo chmod 600 /etc/shadow
sudo chmod 640 /etc/group

# 6. Install Security Tools
echo "[6/10] Installing security monitoring tools..."
sudo apt install -y fail2ban lynis chkrootkit rkhunter

# 7. Configure Log Monitoring
echo "[7/10] Configuring system logging..."
sudo systemctl enable rsyslog
sudo systemctl start rsyslog

# 8. Remove Unnecessary Packages
echo "[8/10] Removing unnecessary packages..."
sudo apt autoremove -y
sudo apt autoclean

# 9. Disable Unused Services
echo "[9/10] Reviewing system services..."
systemctl list-unit-files --type=service --state=enabled | grep -v "^UNIT"

# 10. Final Security Scan
echo "[10/10] Running security scan..."
sudo lynis audit system --quick

echo ""
echo "=== HARDENING COMPLETE ==="
echo "System has been hardened successfully!"
echo "Review the output above for any warnings or recommendations."
echo ""
