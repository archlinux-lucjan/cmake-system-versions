
set(MAC_OS_SIERRA 0)

include(Platform/Darwin/Version/FindDetectFiles)



if(DEFINED MAC_OS_SIERRA)
        if(SW_VERS AND CUT)
            if(${OS_END_RESULT_SW_VERS} MATCHES "10.12")
                set(MAC_OS_SIERRA 1)
            else()
                set(MAC_OS_SIERRA 0)
            endif()
        elseif(SYSTEM_PROFILER AND SED)
            if(${OS_END_RESULT_SYSTEM_PROFILER} MATCHES "10.12")
                set(MAC_OS_SIERRA 1)
            else()
                set(MAC_OS_SIERRA 0)
            endif()
        endif()
endif()    
