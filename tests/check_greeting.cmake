execute_process(
    COMMAND "${PROGRAM}"
    RESULT_VARIABLE exit_code
    OUTPUT_VARIABLE output
    ERROR_VARIABLE error_output
)

if(NOT exit_code STREQUAL "0")
    message(FATAL_ERROR "Program exited with ${exit_code}.\n${error_output}")
endif()

set(expected "Система управления онлайн-курсами\n")
if(NOT output STREQUAL expected)
    message(FATAL_ERROR "Expected output:\n${expected}Actual output:\n${output}")
endif()
