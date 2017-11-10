
set(MAC_OS_X_TIGER 0)

include(Platform/Darwin/Version/FindDetectFiles)



if(DEFINED MAC_OS_X_TIGER)
        if(SW_VERS AND CUT)
            if(${OS_END_RESULT_SW_VERS} MATCHES "10.4")
                set(MAC_OS_X_TIGER 1)
            else()
                set(MAC_OS_X_TIGER 0)
            endif()
        elseif(SYSTEM_PROFILER AND SED)
            if(${OS_END_RESULT_SYSTEM_PROFILER} MATCHES "10.4")
                set(MAC_OS_X_TIGER 1)
            else()
                set(MAC_OS_X_TIGER 0)
            endif()
        endif()
endif()  
 
