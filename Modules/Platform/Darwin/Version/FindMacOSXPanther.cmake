
set(MAC_OS_X_PANTHER 0)

include(Platform/Darwin/Version/FindDetectFiles)



if(DEFINED MAC_OS_X_PANTHER)
        if(SW_VERS AND CUT)
            if(${OS_END_RESULT_SW_VERS} MATCHES "10.3")
                set(MAC_OS_X_PANTHER 1)
            else()
                set(MAC_OS_X_PANTHER 0)
            endif()
        elseif(SYSTEM_PROFILER AND SED)
            if(${OS_END_RESULT_SYSTEM_PROFILER} MATCHES "10.3")
                set(MAC_OS_X_PANTHER 1)
            else()
                set(MAC_OS_X_PANTHER 0)
            endif()
        endif()
endif() 

