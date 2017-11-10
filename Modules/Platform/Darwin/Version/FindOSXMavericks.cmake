
set(OS_X_MAVERICKS 0)

include(Platform/Darwin/Version/FindDetectFiles)



if(DEFINED OS_X_MAVERICKS)
        if(SW_VERS AND CUT)
            if(${OS_END_RESULT_SW_VERS} MATCHES "10.9")
                set(OS_X_MAVERICKS 1)
            else()
                set(OS_X_MAVERICKS 0)
            endif()
        elseif(SYSTEM_PROFILER AND SED)
            if(${OS_END_RESULT_SYSTEM_PROFILER} MATCHES "10.9")
                set(OS_X_MAVERICKS 1)
            else()
                set(OS_X_MAVERICKS 0)
            endif()
        endif()
endif()   
 
