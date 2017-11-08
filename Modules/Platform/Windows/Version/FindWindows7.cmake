
set(WINDOWS_7 0)

include(Platform/Windows/Version/FindDetectFiles)


if(DEFINED WINDOWS_7)  
    if(WMIC)
        string(FIND "${WMIC_CAPTION_LINE}" "Microsoft Windows 7" WINDOWS_7_POSITION)
        if(${WINDOWS_7_POSITION} GREATER -1)
            set(WINDOWS_7 1)
        else()
            set(WINDOWS_7 0)
        endif()
    elseif(SYSTEMINFO AND FINDSTR)
        string(FIND "${SYSTEM_INFO_LINE}" "Microsoft Windows 7" WINDOWS_7_POSITION)
        if(${WINDOWS_7_POSITION} GREATER -1)
            set(WINDOWS_7 1)
        else()
            set(WINDOWS_7 0)
        endif()
    endif()
endif()  
