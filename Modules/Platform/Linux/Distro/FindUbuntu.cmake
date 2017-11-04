
set(UBUNTU 0)

include(Platform/Linux/Distro/FindDetectFiles)


if (CAT AND SED)
    if(DEFINED UBUNTU)
        if(EXISTS /etc/os-release)
            string(FIND ${OS_RELEASE_DISTRO} "Ubuntu" UBUNTU_POSITION)
            if(${UBUNTU_POSITION} GREATER -1)
                set(UBUNTU 1)
            else()
                set(UBUNTU 0)
            endif()
        else()
            if(${LSB_RELEASE_DISTRO} MATCHES "Ubuntu")
                set(UBUNTU 1)
            else()
                set(UBUNTU 0)
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
