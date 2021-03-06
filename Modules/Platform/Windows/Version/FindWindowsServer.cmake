
set(WINDOWS_SERVER 0)

include(Platform/Windows/Version/FindDetectFiles)


if(DEFINED WINDOWS_SERVER)
    if(WMIC)
        string(FIND "${WMIC_CAPTION_LINE}" "Microsoft Windows Server" WINDOWS_SERVER_POSITION)
        string(FIND "${WMIC_CAPTION_LINE}" "Microsoft(R) Windows(R) Server" WINDOWS_SERVER_POSITION_R)
        string(FIND "${WMIC_CAPTION_LINE}" "Microsoftr Windows Serverr" WINDOWS_SERVER_POSITION_r)
        string(FIND "${WMIC_CAPTION_LINE}" "Microsoft Windows Home Server" WINDOWS_SERVER_POSITION_HOME)
        if(${WINDOWS_SERVER_POSITION} GREATER -1 OR ${WINDOWS_SERVER_POSITION_R} GREATER -1 OR ${WINDOWS_SERVER_POSITION_r} GREATER -1 OR ${WINDOWS_SERVER_POSITION_HOME} GREATER -1)
            set(WINDOWS_SERVER 1)
        else()
            set(WINDOWS_SERVER 0)
        endif()
    elseif(SYSTEMINFO AND FINDSTR)
        string(FIND "${SYSTEM_INFO_LINE}" "Microsoft Windows Server" WINDOWS_SERVER_POSITION)
        string(FIND "${SYSTEM_INFO_LINE}" "Microsoft(R) Windows(R) Server" WINDOWS_SERVER_POSITION_R)
        string(FIND "${SYSTEM_INFO_LINE}" "Microsoftr Windows Serverr" WINDOWS_SERVER_POSITION_r)
        string(FIND "${SYSTEM_INFO_LINE}" "Microsoft Windows Home Server" WINDOWS_SERVER_POSITION_HOME)
        if(${WINDOWS_SERVER_POSITION} GREATER -1 OR ${WINDOWS_SERVER_POSITION_R} GREATER -1 OR ${WINDOWS_SERVER_POSITION_r} GREATER -1 OR ${WINDOWS_SERVER_POSITION_HOME} GREATER -1)
            set(WINDOWS_SERVER 1)
        else()
            set(WINDOWS_SERVER 0)
        endif()
    endif()
endif()    
