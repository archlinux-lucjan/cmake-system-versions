
set(OTHER_DISTRO_NAME "UNKNOWN")

include(Platform/Linux/Distro/FindDetectFiles)

if(CAT AND SED)
    if(DEFINED OTHER_DISTRO_NAME)
        if(EXISTS /etc/os-release)
                set(OTHER_DISTRO_NAME ${OS_RELEASE_DISTRO})
        elseif(EXISTS /etc/lsb-release)
                set(OTHER_DISTRO_NAME ${LSB_RELEASE_DISTRO})
        else()
                exec_program(${CAT} ARGS /etc/issue OUTPUT_VARIABLE ISSUE_RELEASE_TEXT)
                exec_program(${SED} ARGS ${TRIM_VARIABLE_REGEX} ${ISSUE_RELEASE_TEXT} OUTPUT_VARIABLE ISSUE_RELEASE_DISTRO_LINE) 
                set(OTHER_DISTRO_NAME ${ISSUE_RELEASE_DISTRO_LINE})
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
