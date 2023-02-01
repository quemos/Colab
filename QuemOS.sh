wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
clear
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Please wait for installing...
sudo apt update -y > /dev/null 2>&1
echo "Installing QEMU (2-3m)..."
sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
echo Downloading...
curl -L -o QuemOS.iso https://github.com/quemos/QuemOS/releases/download/latest/QuemOS.1.2x86_64.iso
echo "QuemOS On Google Cloud Shell"
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Note: Use Right-Click To Copy"
echo "Please Keep Cloud Shell Tab Open"
echo Root password: root
cpu=$(echo nproc | bash)
sudo qemu-system-x86_64 -vnc :0 -cdrom QuemOS.iso  -smp cores=8  -m 1000M -machine usb=on -device usb-tablet > /dev/null 2>&1
