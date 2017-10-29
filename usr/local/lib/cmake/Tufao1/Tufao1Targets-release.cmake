#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "tufao1" for configuration "Release"
set_property(TARGET tufao1 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tufao1 PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "Qt5::Core;Qt5::Network"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtufao1.so.1.3.9"
  IMPORTED_SONAME_RELEASE "libtufao1.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS tufao1 )
list(APPEND _IMPORT_CHECK_FILES_FOR_tufao1 "${_IMPORT_PREFIX}/lib/libtufao1.so.1.3.9" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
