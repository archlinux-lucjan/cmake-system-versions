set(NETBSD 0)

include(Platform/BSD/Distro/FindDetectFiles)

if(DEFINED NETBSD) 
    if(${BSD_OS_NAME_UNAME} MATCHES "NetBSD")
        set(NETBSD 1)
    else()
        set(NETBSD 0)
    endif()
endif() 
