# OpenGL comes from libmali on ev/eg, when egl is enabled
DEPENDS_MALI_XLNX = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' libmali-xlnx', '', d)}"
DEPENDS:append:mali400 = "${@bb.utils.contains('WRL_RECIPES:xilinx', 'libmali-xlnx', ' ${DEPENDS_MALI_XLNX}', ' mesa', d)}"

PACKAGE_ARCH:mali400 = "${@bb.utils.contains('PACKAGECONFIG', 'egl', '${SOC_VARIANT_ARCH}', '${TUNE_PKGARCH}', d)}"

PACKAGECONFIG:remove:mali400 = " wayland"
FILESEXTRAPATHS:prepend := "${THISDIR}/mesa-demos:"
MESA_DEMOS_PATCHES = " \
	file://0001-Revert-eglinfo-Extend-for-EGL_EXT_platform_device.patch \
	file://0001-Revert-eglinfo-Add-EXT_platform_-awareness.patch \
"
SRC_URI:append:zynqmp = "${@bb.utils.contains('WRL_RECIPES:xilinx', 'libmali-xlnx', ' ${MESA_DEMOS_PATCHES}', ' ', d)}"
