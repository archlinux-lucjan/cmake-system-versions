#set(OS_VERSION_SYSTEM_PROFILER_REGEX "s!^[ ]*System\ Version[^0-9]*\([0-9]\{1,2\}\.[0-9]\{1,2\}\)\..*$!\1!p")


find_program(SW_VERS sw_vers HINTS "/usr/bin" "${OSX_DEVELOPER_ROOT}/usr/bin" "/bin")

find_program(SYSTEM_PROFILER system_profiler HINTS "/usr/bin" "${OSX_DEVELOPER_ROOT}/usr/bin" "/bin")

find_program(SED sed HINTS "/usr/bin" "${OSX_DEVELOPER_ROOT}/usr/bin" "/bin")
find_program(CUT cut HINTS "/usr/bin" "${OSX_DEVELOPER_ROOT}/usr/bin" "/bin")
    
exec_program(${SW_VERS} ARGS -productVersion OUTPUT_VARIABLE OS_VERSION_SW_VERS)
exec_program(${SW_VERS} ARGS -productName OUTPUT_VARIABLE OS_NAME_SW_VERS)
exec_program(${CUT} ARGS "-f1,2\ -d\"-\"" ${OS_VERSION_SW_VERS} OUTPUT_VARIABLE OS_END_RESULT_SW_VERS)  
exec_program(${SYSTEM_PROFILER} ARGS SPSoftwareDataType OUTPUT_VARIABLE OS_VERSION_SYSTEM_PROFILER)
exec_program(echo ARGS ${OS_VERSION_SYSTEM_PROFILER} OUTPUT_VARIABLE ECHO_OS_VERSION_SYSTEM_PROFILER)


string(REGEX MATCHALL "[ ]*System[ ]*Version:[ A-Za-z]*[0-9][0-9]?.[0-9][0-9]?" matches ${ECHO_OS_VERSION_SYSTEM_PROFILER})


string(REGEX REPLACE "[ ]*System[ ]*Version:[ A-Za-z]*" "" VERSION_SYSTEM_PROFILER_REDUCED "${matches}")
string(REGEX REPLACE "[ ]*System[ ]*Version:[ ]*" "" VERSION_SYSTEM_PROFILER_REDUCED_OTHER "${matches}") # for results, that haven't been found in Find files

string(STRIP "${VERSION_SYSTEM_PROFILER_REDUCED}" OS_END_RESULT_SYSTEM_PROFILER)
string(STRIP "${VERSION_SYSTEM_PROFILER_REDUCED_OTHER}" OS_END_RESULT_SYSTEM_PROFILER_OTHER) # for results, that haven't been found in Find files
