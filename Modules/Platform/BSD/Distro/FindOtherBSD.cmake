set(OTHER_BSD_NAME "UNKNOWN")

include(Platform/BSD/Distro/FindDetectFiles)

if(DEFINED OTHER_BSD_NAME) 
    if(NOT "${BSD_OS_NAME_UNAME}" MATCHES "")
        set(OTHER_BSD_NAME ${BSD_OS_NAME_UNAME})
    else()
        set(OTHER_BSD_NAME "UNKNOWN")
    endif()
endif()   
