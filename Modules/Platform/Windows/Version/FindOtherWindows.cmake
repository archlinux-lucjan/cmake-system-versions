
set(OTHER_WINDOWS_NAME "UNKNOWN")

include(Platform/Windows/Version/FindDetectFiles)


if(DEFINED OTHER_WINDOWS_NAME)
    if(SYSTEMINFO AND FINDSTR)
        string(FIND ${SYSTEM_INFO_LINE} "Microsoft Windows 10" WINDOWS_10_POSITION)
        if(${WINDOWS_10_POSITION} GREATER -1)
            set(OTHER_WINDOWS_NAME 1)
        else()
            set(OTHER_WINDOWS_NAME "UNKNOWN")
        endif()
    elseif(WMIC)
        string(FIND ${WMIC_CAPTION_LINE} "Microsoft Windows 10" WINDOWS_10_POSITION)
        if(${WINDOWS_10_POSITION} GREATER -1)
            set(OTHER_WINDOWS_NAME 1)
        else()
            set(OTHER_WINDOWS_NAME "UNKNOWN")
        endif()
    endif()
endif() 
