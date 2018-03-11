DESCRIPTION = "Basic image"
LICENSE = "MIT"

# set password to iot
inherit extrausers
EXTRA_USERS_PARAMS = " \
    usermod -P iot root; \
    "

inherit core-image image-buildinfo

# Package
IMAGE_FEATURES += "package-management"

# SSH 
IMAGE_FEATURES += "ssh-server-dropbear"

MIKROBUS_INSTALL = " \
    clicks-board-init \
"

CONNECTIVITY_INSTALL = " \
    iw \
    mosquitto \
    mosquitto-clients \
    libmosquitto1 \
    libmosquittopp1 \
    modemmanager \
"

CORE_OS_INSTALL = " \
    hwrevision \
    sysfsutils \
    kernel-image \
    kernel-modules \
    kernel-devicetree \
    swupdate \
    swupdate-www \
    swupdate-tools \
"

IMAGE_INSTALL += " \
    ${CORE_OS_INSTALL} \
    openssh-sftp-server \
    packagegroup-distro-base \
    packagegroup-machine-base \
    ${MIKROBUS_INSTALL} \
    ${CONNECTIVITY_INSTALL} \
    packagegroup-iot-base \
    packagegroup-tools-io \
"

export IMAGE_BASENAME = "project-base-image"

IMAGE_BUILDINFO_VARS = " \
    BB_VERSION \
    BUILD_SYS  \
    NATIVELSBSTRING \
    TARGET_SYS \
    MACHINE \
    DISTRO \
    DISTRO_VERSION \
    TUNE_FEATURES \
    TARGET_FPU \
"
