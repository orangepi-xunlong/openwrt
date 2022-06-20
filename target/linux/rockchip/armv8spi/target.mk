ARCH:=aarch64
SUBTARGET:=armv8spi
BOARDNAME:=RK33xx boards for spi boot (64 bit)

define Target/Description
	Build spi boot firmware image for Rockchip RK33xx devices.
	This firmware features a 64 bit kernel.
endef
