sudo service klipper stop

cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.mcuMaxEz
make menuconfig KCONFIG_CONFIG=config.mcuMaxEz
make KCONFIG_CONFIG=config.mcuMaxEz
read -p "MCU MaxEz firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
./scripts/flash-sdcard.sh /dev/ttyACM0 btt-maxez-h723-hw
read -p "MCU MaxEz firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=config.rpi

make clean KCONFIG_CONFIG=config.NiteHawkSB
make menuconfig KCONFIG_CONFIG=config.NiteHawkSB
make KCONFIG_CONFIG=config.NiteHawkSB
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_rp2040_313436333211AB32-if00 KCONFIG_CONFIG=config.NiteHawkSB

#make clean KCONFIG_CONFIG=config.ebbSB2209
#make menuconfig KCONFIG_CONFIG=config.ebbSB2209
#make KCONFIG_CONFIG=config.ebbSB2209
#read -p "EBB SB2209 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#python3 flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 31ab7667444a
#read -p "EBB SB2209 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

sudo service klipper start
