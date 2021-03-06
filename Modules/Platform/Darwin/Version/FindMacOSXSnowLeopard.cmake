
set(MAC_OS_X_SNOW_LEOPARD 0)

include(Platform/Darwin/Version/FindDetectFiles)



if(DEFINED MAC_OS_X_SNOW_LEOPARD)
        if(SW_VERS AND CUT)
            if(${OS_END_RESULT_SW_VERS} MATCHES "10.6")
                set(MAC_OS_X_SNOW_LEOPARD 1)
            else()
                set(MAC_OS_X_SNOW_LEOPARD 0)
            endif()
        elseif(SYSTEM_PROFILER AND SED)
            if(${OS_END_RESULT_SYSTEM_PROFILER} MATCHES "10.6")
                set(MAC_OS_X_SNOW_LEOPARD 1)
            else()
                set(MAC_OS_X_SNOW_LEOPARD 0)
            endif()
        endif()
endif()  
