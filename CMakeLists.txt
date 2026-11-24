cmake_minimum_required(VERSION 3.25)
project(online_course_manager LANGUAGES CXX)

add_executable(online-course-manager main.cpp)
set_target_properties(online-course-manager PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED ON
    CXX_EXTENSIONS OFF
)

if(CMAKE_CXX_COMPILER_ID MATCHES "^(GNU|Clang|AppleClang)$")
    target_compile_options(online-course-manager PRIVATE -Wall -Wextra -Wpedantic)
endif()

include(CTest)
if(BUILD_TESTING)
    add_test(NAME startup_greeting
        COMMAND "${CMAKE_COMMAND}"
            "-DPROGRAM=$<TARGET_FILE:online-course-manager>"
            -P "${CMAKE_CURRENT_SOURCE_DIR}/tests/check_greeting.cmake"
    )
    set_tests_properties(startup_greeting PROPERTIES TIMEOUT 5)
endif()
