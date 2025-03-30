sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service
sudo sh -c "echo RP25 > /proc/acpi/wakeup"
