
set(OS_X_EL_CAPITAN 0)

include(Platform/Darwin/Version/FindDetectFiles)



if(DEFINED OS_X_EL_CAPITAN)
        if(SW_VERS AND CUT)
            if(${OS_END_RESULT_SW_VERS} MATCHES "10.11")
                set(OS_X_EL_CAPITAN 1)
            else()
                set(OS_X_EL_CAPITAN 0)
            endif()
        elseif(SYSTEM_PROFILER AND SED)
            if(${OS_END_RESULT_SYSTEM_PROFILER} MATCHES "10.11")
                set(OS_X_EL_CAPITAN 1)
            else()
                set(OS_X_EL_CAPITAN 0)
            endif()
        endif()
endif()   
