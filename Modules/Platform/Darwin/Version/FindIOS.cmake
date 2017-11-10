
set(IOS 0)

include(Platform/Darwin/Version/FindDetectFiles)


if(DEFINED IOS)
        if(SW_VERS)
            string(FIND "${OS_NAME_SW_VERS}" "iPhone" IPHONE_POSITION)
            if(${IPHONE_POSITION} GREATER -1)
                set(IOS 1)
            else()
                set(IOS 0)
            endif()
        endif()
endif()    

 
