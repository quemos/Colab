!wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
!unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
!read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
!./ngrok authtoken $CRP 
!nohup ./ngrok tcp 5900 &>/dev/null &
!echo Please wait for installing...
!sudo apt update -y > /dev/null 2>&1
!echo "Installing QEMU (2-3m)..."
!sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
!echo Downloading...
!wget  https://github.com/quemos/QuemOS/releases/download/latest/QuemOS.1.2x86_64.iso
!echo "QuemOS On Google Colab"
!echo Your VNC IP Address:
!curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
!echo "Note: Use Right-Click Or Ctrl+C To Copy"
!echo "Please Keep Colab Tab Open, Maximum Time 12h"
!echo Root password: root
!sudo qemu-system-x86_64 -vnc :0 -cdrom QuemOS.1.2x86_64.iso  -smp cores=8  -m 10000M -machine usb=on -device usb-tablet > /dev/null 2>&1
