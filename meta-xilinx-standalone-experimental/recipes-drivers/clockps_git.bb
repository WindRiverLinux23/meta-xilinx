inherit features_check

REQUIRED_MACHINE_FEATURES = "clockps"

inherit esw

DEPENDS += "xilstandalone "

ESW_COMPONENT_SRC = "/XilinxProcessorIPLib/drivers/clockps/src/"
ESW_COMPONENT_NAME = "libclockps.a"
