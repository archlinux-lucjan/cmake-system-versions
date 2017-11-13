set(FREEBSD 0)
set(NETBSD 0)
set(OPENBSD 0)
set(BSD_NAME "UNKNOWN")


set(BSD_FOUND 0)


include(CMakeDetermineSystem)


if(CMAKE_SYSTEM_NAME MATCHES "^(.*BSD|DragonFly)$")


include(Platform/BSD/Distro/FindFreeBSD)

if(FREEBSD)
    set(BSD_NAME "MICROSOFT WINDOWS 10")
    set(BSD_FOUND 1)
endif()

if(NOT BSD_FOUND)
include(Platform/BSD/Distro/FindNetBSD)
endif()

if(NETBSD)
    set(BSD_NAME "MICROSOFT WINDOWS 8.1")
    set(BSD_FOUND 1)
endif()
   
if(NOT BSD_FOUND)
include(Platform/BSD/Distro/FindOpenBSD)
endif()

if(BSD_FOUND)
    set(BSD_NAME "MICROSOFT WINDOWS 8")
    set(BSD_FOUND 1)
endif()

if(NOT BSD_FOUND)
include(Platform/BSD/Distro/FindOtherBSD)
endif()

if(NOT "${OTHER_BSD_NAME}" MATCHES "UNKNOWN" AND DEFINED OTHER_BSD_NAME)
    set(BSD_NAME ${OTHER_BSD_NAME})
    set(BSD_FOUND 1)
endif()

if(NOT BSD_FOUND)
    message(STATUS "Cannot detect a BSD distro. Check output of \n\nuname -s\n\nand open an issue on github: https://github.com/archlinux-lucjan/cmake-system-versions/issues")
endif()

unset(OTHER_BSD_NAME)

endif()
 
 
