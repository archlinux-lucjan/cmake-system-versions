set(FREEBSD 0)

include(Platform/BSD/Distro/FindDetectFiles)

if(DEFINED FREEBSD) 
    if(${BSD_OS_NAME_UNAME} MATCHES "FreeBSD")
        set(FREEBSD 1)
    else()
        find_program(FRBSDVERSION freebsd-version HINTS "/usr/bin" "/usr/local/bin" "/sbin" "/usr/local/sbin" "/bin" "/root/bin")
        if(FRBSDVERSION)
            set(FREEBSD 1)
        else
            set(FREEBSD 0)
        endif()
    endif()
endif()
