set(WINDOWS_10 0)
set(WINDOWS_8_1 0)
set(WINDOWS_8 0)
set(WINDOWS_7 0)
set(WINDOWS_VISTA 0)
set(WINDOWS_XP 0)
set(WINDOWS_SERVER 0)
set(WINDOWS_NAME "UNKNOWN")


set(WINDOWS_FOUND 0)


include(CMakeDetermineSystem)


if(CMAKE_SYSTEM_NAME MATCHES "Windows")


include(Platform/Windows/Version/FindWindows10)

if(WINDOWS_10)
    set(WINDOWS_NAME "MICROSOFT WINDOWS 10")
    set(WINDOWS_FOUND 1)
endif()

if(NOT WINDOWS_FOUND)
include(Platform/Windows/Version/FindWindows81)
endif()

if(WINDOWS_8_1)
    set(WINDOWS_NAME "MICROSOFT WINDOWS 8.1")
    set(WINDOWS_FOUND 1)
endif()
   
if(NOT WINDOWS_FOUND)
include(Platform/Windows/Version/FindWindows8)
endif()

if(WINDOWS_8)
    set(WINDOWS_NAME "MICROSOFT WINDOWS 8")
    set(WINDOWS_FOUND 1)
endif()

if(NOT WINDOWS_FOUND)
include(Platform/Windows/Version/FindWindows7)
endif()

if(WINDOWS_7)
    set(WINDOWS_NAME "MICROSOFT WINDOWS 7")
    set(WINDOWS_FOUND 1)
endif()

if(NOT WINDOWS_FOUND)
include(Platform/Windows/Version/FindWindowsVista)
endif()

if(WINDOWS_VISTA)
    set(WINDOWS_NAME "MICROSOFT WINDOWS VISTA")
    set(WINDOWS_FOUND 1)
endif()

if(NOT WINDOWS_FOUND)
include(Platform/Windows/Version/FindWindowsXP)
endif()

if(WINDOWS_XP)
    set(WINDOWS_NAME "MICROSOFT WINDOWS XP")
    set(WINDOWS_FOUND 1)
endif()

if(NOT WINDOWS_FOUND)
include(Platform/Windows/Version/FindWindowsServer)
endif()

if(WINDOWS_SERVER)
    set(WINDOWS_NAME "MICROSOFT WINDOWS SERVER")
    set(WINDOWS_FOUND 1)
endif()

if(NOT WINDOWS_FOUND)
include(Platform/Windows/Version/FindOtherWindows)
endif()

if(NOT ${OTHER_WINDOWS_NAME} MATCHES "UNKNOWN")
    set(WINDOWS_NAME ${OTHER_WINDOWS_NAME})
    set(WINDOWS_FOUND 1)
endif()

if(NOT WINDOWS_FOUND)
    message(STATUS "Cannot detect a Windows version")
endif()

unset(OTHER_WINDOWS_NAME)

endif()
 
