# Process related issues are usually related to problems encountered by the cscript.exe that runs it. It's a reason, why it's not used below as one from detection methods.
# ver command is used only, when there aren't the same version numbers for Windows Editions (It's not rare, when Windows for Desktop has the same version as Windows Server)
 
find_program(SYSTEMINFO systeminfo "C:\\WINDOWS\\system32" "C:\\WINDOWS") # for WindowsXP, Windows Vista, Windows 7, Windows Server Editions
find_program(FINDSTR findstr "C:\\WINDOWS\\system32" "C:\\WINDOWS")
find_program(WMIC wmic "C:\\WINDOWS\\system32" "C:\\WINDOWS") # for Windows XP, Windows 7


if(SYSTEMINFO AND FINDSTR)
file(WRITE ${CMAKE_BINARY_DIR}/countLines.bat [[@findstr /C:"OS Name" %1]])
execute_process(COMMAND cmd.exe /C systeminfo COMMAND countLines.bat WORKING_DIRECTORY ${CMAKE_BINARY_DIR} OUTPUT_VARIABLE SYSTEM_INFO_LINE_WITH_OS_NAME OUTPUT_STRIP_TRAILING_WHITESPACE)
string(REGEX REPLACE "OS Name:" "" SYSTEM_INFO_WITHOUT_OS_NAME "${SYSTEM_INFO_LINE_WITH_OS_NAME}")
string(STRIP "${SYSTEM_INFO_WITHOUT_OS_NAME}" SYSTEM_INFO_LINE) 
file(REMOVE ${CMAKE_BINARY_DIR}/countLines.bat)
endif()

if(WMIC)
    execute_process(COMMAND wmic os get Caption /value OUTPUT_VARIABLE WMIC_CAPTION_LINE_WITH_CAPTION OUTPUT_STRIP_TRAILING_WHITESPACE)
string(REGEX REPLACE "Caption=" "" WMIC_CAPTION_LINE_WITHOUT_CAPTION  "${WMIC_CAPTION_LINE_WITH_CAPTION}")
string(STRIP "${WMIC_CAPTION_LINE_WITHOUT_CAPTION}" WMIC_CAPTION_LINE) 
endif()
