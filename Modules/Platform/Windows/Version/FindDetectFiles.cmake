# Process related issues are usually related to problems encountered by the cscript.exe that runs it. It's a reason, why it's not used below as one from detection methods.
# ver command is used only, when there aren't the same version numbers for Windows Editions (It's not rare, when Windows for Desktop has the same version as Windows Server)
 
 
find_program(VER ver "C:\\WINDOWS\\system32" "C:\\WINDOWS") # for Windows XP, Windows Vista
find_program(SYSTEMINFO systeminfo "C:\\WINDOWS\\system32" "C:\\WINDOWS") # for WindowsXP, Windows Vista, Windows 7, Windows Server Editions
find_program(FINDSTR findstr "C:\\WINDOWS\\system32" "C:\\WINDOWS")
find_program(WMIC wmic "C:\\WINDOWS\\system32" "C:\\WINDOWS") # for Windows XP, Windows 7

if(VER)
    execute_process(COMMAND cmd.exe /c ver OUTPUT_VARIABLE WIN_VER )
endif()

if(SYSTEMINFO AND FINDSTR)
    execute_process(COMMAND cmd.exe /c "systeminfo\ |\ findstr\ /B\ /C:\"OS\ Name\"" OUTPUT_VARIABLE SYSTEM_INFO_LINE )
endif()

if(WMIC)
    execute_process(COMMAND wmic os get Caption /value OUTPUT_VARIABLE WMIC_CAPTION_LINE )
endif()
