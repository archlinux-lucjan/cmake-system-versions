set(OPENBSD 0)

include(Platform/BSD/Distro/FindDetectFiles)

if(DEFINED OPENBSD) 
    if(${BSD_OS_NAME_UNAME} MATCHES "OpenBSD")
        set(OPENBSD 1)
    else()
        set(OPENBSD 0)
    endif()
endif()  
