set(ARCH_LINUX 0)
set(MANJARO_LINUX 0)
set(FEDORA 0)
set(UBUNTU 0)
set(LINUX_MINT 0)
set(DEBIAN 0)
set(GENTOO 0)
set(CENTOS 0)
set(REDHAT 0)
set(LINUX_FROM_SCRATCH 0)
set(SLACKWARE 0)
set(PCLINUXOS 0)
set(OPENSUSE 0)
set(SLES 0)
set(DISTRO_NAME "UNKNOWN")


set(DISTRO_FOUND 0)


include(CMakeDetermineSystem)


if(CMAKE_SYSTEM_NAME MATCHES "Linux")


include(Platform/Linux/Distro/FindGentoo)

if(GENTOO)
    set(DISTRO_NAME "GENTOO")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindArchLinux)
endif()

if(ARCH_LINUX)
    set(DISTRO_NAME "ARCH LINUX")
    set(DISTRO_FOUND 1)
endif()
   
if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindManjaroLinux)
endif()

if(MANJARO_LINUX)
    set(DISTRO_NAME "MANJARO LINUX")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindFedora)
endif()

if(FEDORA)
    set(DISTRO_NAME "FEDORA")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindLinuxMint)
endif()

if(LINUX_MINT)
    set(DISTRO_NAME "LINUX MINT")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindDebian)
endif()

if(DEBIAN)
    set(DISTRO_NAME "DEBIAN")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindUbuntu)
endif()

if(UBUNTU)
    set(DISTRO_NAME "UBUNTU")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindCentOS)
endif()

if(CENTOS)
    set(DISTRO_NAME "CENTOS")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindPCLinuxOS)
endif()

if(PCLINUXOS)
    set(DISTRO_NAME "PCLINUXOS")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindSLES)
endif()

if(SLES)
    set(DISTRO_NAME "SLES")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindOpenSUSE)
endif()

if(OPENSUSE)
    set(DISTRO_NAME "OPENSUSE")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindRedHat)
endif()

if(REDHAT)
    set(DISTRO_NAME "RED HAT")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindLinuxFromScratch)
endif()

if(LINUX_FROM_SCRATCH)
    set(DISTRO_NAME "LINUX FROM SCRATCH")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindSlackware)
endif()

if(SLACKWARE)
    set(DISTRO_NAME "SLACKWARE")
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
include(Platform/Linux/Distro/FindOtherLinux)
endif()

if(NOT "${OTHER_DISTRO_NAME}" MATCHES "UNKNOWN" AND DEFINED OTHER_DISTRO_NAME)
    set(DISTRO_NAME ${OTHER_DISTRO_NAME})
    set(DISTRO_FOUND 1)
endif()

if(NOT DISTRO_FOUND)
    message(STATUS "Cannot detect a linux distribution. Probably you haven't the access to sed and cat commands or you haven't /etc/os-release, /etc/*-release or /etc/lsb-release files or they are empty.")
endif()

unset(OTHER_DISTRO_NAME)

endif()
