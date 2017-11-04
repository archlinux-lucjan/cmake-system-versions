
set(LINUX_MINT 0)

include(Platform/Linux/Distro/FindDetectFiles)


if(CAT AND SED)
    if(DEFINED LINUX_MINT)
        if(EXISTS /etc/os-release)
            if(${OS_RELEASE_DISTRO} MATCHES "Linux Mint")
                set(LINUX_MINT 1)
            else()
                set(LINUX_MINT 0)
            endif()
        elseif(EXISTS /etc/linuxmint/info)
            exec_program(${CAT} ARGS /etc/linuxmint/info OUTPUT_VARIABLE DISTRO_RELEASE_TEXT)
            exec_program(${SED} ARGS ${REMOVE_NOT_MATCHED_DISTRO} ${DISTRO_RELEASE_TEXT} OUTPUT_VARIABLE DISTRO_RELEASE_DISTRO_LINE)
            string(FIND ${DISTRO_RELEASE_DISTRO_LINE} "Linux Mint" LINUX_MINT_POSITION)
            if(${LINUX_MINT_POSITION} GREATER -1)
                set(LINUX_MINT 1)
            else()
                set(LINUX_MINT 0)
            endif()
        else()
            if(${LSB_RELEASE_DISTRO} MATCHES "LinuxMint")
                set(LINUX_MINT 1)
            else()
                set(LINUX_MINT 0)
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
