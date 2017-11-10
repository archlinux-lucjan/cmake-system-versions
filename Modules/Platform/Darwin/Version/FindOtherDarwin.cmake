 
set(OTHER_DARWIN_NAME "UNKNOWN")

include(Platform/Darwin/Version/FindDetectFiles)


if(DEFINED OTHER_DARWIN_NAME)
   if(SW_VERS)
        set(OTHER_DARWIN_NAME "${OS_NAME_SW_VERS} ${OS_VERSION_SW_VERS}")
    elseif(SYSTEM_PROFILER)
        set(OTHER_DARWIN_NAME "${OS_END_RESULT_SYSTEM_PROFILER_OTHER}")
    endif() 
endif()
