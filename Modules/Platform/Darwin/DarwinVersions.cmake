
set(MAC_OS_X_PANTHER 0)
set(MAC_OS_X_TIGER 0)
set(MAC_OS_X_LEOPARD 0)
set(IOS 0)
set(MAC_OS_X_SNOW_LEOPARD 0)
set(MAC_OS_X_LION 0)
set(OS_X_MOUNTAIN_LION 0)
set(OS_X_MAVERICKS 0)
set(OS_X_YOSEMITE 0)
set(OS_X_EL_CAPITAN 0)
set(MAC_OS_SIERRA 0)
set(MAC_OS_HIGH_SIERRA 0)
set(DARWIN_NAME "UNKNOWN")


set(DARWIN_FOUND 0)


include(CMakeDetermineSystem)


if(CMAKE_SYSTEM_NAME MATCHES "Darwin")



include(Platform/Darwin/Version/FindIOS)


if(IOS)
    set(DARWIN_NAME "IOS")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindMacOSXPanther)
endif()

if(MAC_OS_X_PANTHER)
    set(DARWIN_NAME "MAC OS X PANTHER")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindMacOSXTiger)
endif()

if(MAC_OS_X_TIGER)
    set(DARWIN_NAME "MAC OS X TIGER")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindMacOSXLeopard)
endif()

if(MAC_OS_X_LEOPARD)
    set(DARWIN_NAME "MAC OS X LEOPARD")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindMacOSXSnowLeopard)
endif()

if(MAC_OS_X_SNOW_LEOPARD)
    set(DARWIN_NAME "MAC OS X SNOW LEOPARD")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindMacOSXLion)
endif()

if(MAC_OS_X_LION)
    set(DARWIN_NAME "MAC OS X LION")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindOSXMountainLion)
endif()

if(OS_X_MOUNTAIN_LION)
    set(DARWIN_NAME "OS X MOUNTAIN LION")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindOSXMavericks)
endif()

if(OS_X_MAVERICKS)
    set(DARWIN_NAME "OS X MAVERICKS")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindOSXYosemite)
endif()

if(OS_X_YOSEMITE)
    set(DARWIN_NAME "OS X YOSEMITE")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindOSXElCapitan)
endif()

if(OS_X_EL_CAPITAN)
    set(DARWIN_NAME "OS X EL CAPITAN")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindMacOSSierra)
endif()

if(MAC_OS_SIERRA)
    set(DARWIN_NAME "MAC OS SIERRA")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindMacOSHighSierra)
endif()

if(MAC_OS_HIGH_SIERRA)
    set(DARWIN_NAME "MAC OS HIGH SIERRA")
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
include(Platform/Darwin/Version/FindOtherDarwin)
endif()

if(NOT "${OTHER_DARWIN_NAME}" MATCHES "UNKNOWN" AND DEFINED OTHER_DARWIN_NAME)
    set(DARWIN_NAME ${OTHER_DARWIN_NAME})
    set(DARWIN_FOUND 1)
endif()

if(NOT DARWIN_FOUND)
    message(STATUS "Cannot detect a Darwin system name. Maybe you have not an access to sw_vers or system_profiler commands or they have other arguments in your version. Check output of:\nsw_vers -productVersion\n or \nsw_vers -productName\n or \nsystem_profiler SPSoftwareDataType\nand open an issue on github: https://github.com/archlinux-lucjan/cmake-system-versions/issues"")
endif()

unset(OTHER_DARWIN_NAME)

endif()
