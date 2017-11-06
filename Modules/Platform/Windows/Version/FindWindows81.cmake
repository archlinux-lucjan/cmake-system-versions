#This must be included before Windows 8

set(WINDOWS_8_1 0)

include(Platform/Windows/Version/FindDetectFiles)


if(DEFINED WINDOWS_8_1)
    if(SYSTEMINFO AND FINDSTR)
        string(FIND ${SYSTEM_INFO_LINE} "Microsoft Windows 8.1" WINDOWS_8_1_POSITION)
        if(${WINDOWS_8_1_POSITION} GREATER -1)
            set(WINDOWS_8_1 1)
        else()
            set(WINDOWS_8_1 0)
        endif()
    elseif(WMIC)
        string(FIND ${WMIC_CAPTION_LINE} "Microsoft Windows 8.1" WINDOWS_8_1_POSITION)
        if(${WINDOWS_8_1_POSITION} GREATER -1)
            set(WINDOWS_8_1 1)
        else()
            set(WINDOWS_8_1 0)
        endif()
    endif()
endif()  
