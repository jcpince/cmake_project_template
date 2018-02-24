cmake_minimum_required(VERSION 2.8)
project(example C)

set(CMAKE_C_COMPILER /usr/bin/gcc-6)
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS -lpthread)
set(CMAKE_EXE_LINKER_FLAGS "-Wl,-Map=${PROJECT_NAME}.map -lm")
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

set(PROJECT_INCLUDES ${CMAKE_CURRENT_SOURCE_DIR}/include1
  CACHE INTERNAL "" FORCE)

add_subdirectory(dir1)
add_subdirectory(dir2)
add_subdirectory(dir3)

foreach(SRC ${PROJECT_SRC})
  message("Compiling: " ${SRC})
endforeach()

message("PROJECT_INCLUDES: " ${PROJECT_INCLUDES})
foreach(INC ${PROJECT_INCLUDES})
  message("Adding include directory: " ${INC})
  include_directories(${INC})
endforeach()

add_executable(${PROJECT_NAME} ${PROJECT_SRC})

add_custom_target(distclean
  COMMAND ${CMAKE_BUILD_TOOL} clean
  COMMAND ${CMAKE_COMMAND} -E remove -f ${PROJECT_NAME}.map
  COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/clean_all.cmake
)
