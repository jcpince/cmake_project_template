cmake_minimum_required(VERSION 2.8)
set(PROJECT "DEV")
project(${PROJECT})

set(CMAKE_C_COMPILER /usr/bin/gcc-6)
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS -lpthread)
set(CMAKE_EXE_LINKER_FLAGS "-Wl,-Map=output.map -lm")
set(CMAKE_C_FLAGS -ggdb3)
#set(CMAKE_C_LINK_EXECUTABLE "/usr/bin/gcc -o target *.o -lm -lpthread...")

if(NOT TARGET_PLATFORM)
  set(TARGET_PLATFORM "toto")
endif()

if(TARGET_PLATFORM STREQUAL "toto")
  include(platform_${TARGET_PLATFORM}.cmake)
elseif(TARGET_PLATFORM STREQUAL "titi")
  set(USE_FEATURE_TEST3 OFF)
else()
  message(FATAL_ERROR "Please choose a valid target platform, '${TARGET_PLATFORM}' is not a valid platform.")
endif()

set(PROJECT_INCLUDES include1)

add_subdirectory(dir1)
add_subdirectory(dir2)
add_subdirectory(dir3)

foreach(SRC ${SOURCE})
  message("Compiling: " ${SRC})
endforeach()

message("PROJECT_INCLUDES: " ${PROJECT_INCLUDES})
foreach(INC ${PROJECT_INCLUDES})
  message("Adding include directory: " ${INC})
  include_directories(${INC})
endforeach()

add_executable(${PROJECT} ${SOURCE})
