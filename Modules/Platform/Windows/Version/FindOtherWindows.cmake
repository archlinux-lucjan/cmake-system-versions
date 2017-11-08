
set(OTHER_WINDOWS_NAME "UNKNOWN")

include(Platform/Windows/Version/FindDetectFiles)


if(DEFINED OTHER_WINDOWS_NAME)
    if(WMIC)
            set(OTHER_WINDOWS_NAME ${WMIC_CAPTION_LINE})
    elseif(SYSTEMINFO AND FINDSTR)
            set(OTHER_WINDOWS_NAME ${SYSTEM_INFO_LINE})
    else()
            execute_process(COMMAND cmd.exe /C ver OUTPUT_VARIABLE WIN_VER OUTPUT_STRIP_TRAILING_WHITESPACE)
            set(OTHER_WINDOWS_NAME ${WIN_VER})
    endif()
endif() 
