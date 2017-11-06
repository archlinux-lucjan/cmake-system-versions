
set(WINDOWS_10 0)

include(Platform/Windows/Version/FindDetectFiles)


if(DEFINED WINDOWS_10)
    if(SYSTEMINFO AND FINDSTR)
        string(FIND ${SYSTEM_INFO_LINE} "Microsoft Windows 10" WINDOWS_10_POSITION)
        if(${WINDOWS_10_POSITION} GREATER -1)
            set(WINDOWS_10 1)
        else()
            set(WINDOWS_10 0)
        endif()
    elseif(WMIC)
        string(FIND ${WMIC_CAPTION_LINE} "Microsoft Windows 10" WINDOWS_10_POSITION)
        if(${WINDOWS_10_POSITION} GREATER -1)
            set(WINDOWS_10 1)
        else()
            set(WINDOWS_10 0)
        endif()
    endif()
endif()   
