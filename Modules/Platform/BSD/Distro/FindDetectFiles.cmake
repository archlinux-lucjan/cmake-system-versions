
find_program(UNAME uname HINTS "/usr/bin" "/usr/local/bin" "/sbin" "/usr/local/sbin" "/bin" "/root/bin")
exec_program(${UNAME} ARGS -s OUTPUT_VARIABLE BSD_OS_NAME_UNAME)
