
set(DEBIAN 0)

include(Platform/Linux/Distro/FindDetectFiles)


if(CAT AND SED)
    if(DEFINED DEBIAN)
        if(EXISTS /etc/os-release)
            string(FIND ${OS_RELEASE_DISTRO} "Debian" DEBIAN_POSITION)
            if(${DEBIAN_POSITION} GREATER -1)
                set(DEBIAN 1)
            else()
                set(DEBIAN 0)
            endif()
        else()
            if(${LSB_RELEASE_DISTRO} MATCHES "Debian")
                set(DEBIAN 1)
            else()
                set(DEBIAN 0)
            endif()
        endif()
    endif() 
endif()


unset(OS_RELEASE_DISTRO_REGEX)
unset(DISTRO_RELEASE_REGEX)
unset(LSB_RELEASE_REGEX)
unset(TRIM_VARIABLE_REGEX)
unset(REMOVE_NOT_MATCHED_OS)
unset(REMOVE_NOT_MATCHED_DISTRO)
unset(REMOVE_NOT_MATCHED_LSB)
