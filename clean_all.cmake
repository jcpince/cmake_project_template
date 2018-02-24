function(clean_all)
  file(GLOB_RECURSE CMAKE_TEMP
    cmake_install.cmake
    CMakeCache.txt
    Makefile
  )
  foreach(FILEORDIR ${CMAKE_TEMP})
    message("Deleting ${FILEORDIR}")
    file(REMOVE_RECURSE ${FILEORDIR})
  endforeach()
  # TODO: Find a way to browse recursively the build tree
  file(GLOB subdirs CMakeFiles */CMakeFiles)
  foreach(FILEORDIR ${subdirs})
    message("Deleting ${FILEORDIR}")
    file(REMOVE_RECURSE ${FILEORDIR})
  endforeach()
endfunction(clean_all)

clean_all()
