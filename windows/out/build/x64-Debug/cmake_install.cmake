# Install script for directory: C:/Users/HP_Demo/vet_bookr_original/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/runner/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/cloud_firestore/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/file_selector_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/firebase_auth/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/firebase_core/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/firebase_storage/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/geolocator_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/maps_launcher/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/permission_handler_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/url_launcher_windows/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/vet_bookr.exe")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug" TYPE EXECUTABLE FILES "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/runner/vet_bookr.exe")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/data/icudtl.dat")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/data" TYPE FILE FILES "C:/Users/HP_Demo/vet_bookr_original/windows/flutter/ephemeral/icudtl.dat")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/flutter_windows.dll")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug" TYPE FILE FILES "C:/Users/HP_Demo/vet_bookr_original/windows/flutter/ephemeral/flutter_windows.dll")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/cloud_firestore_plugin.lib;C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/file_selector_windows_plugin.dll;C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/firebase_auth_plugin.lib;C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/firebase_core_plugin.lib;C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/firebase_storage_plugin.lib;C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/geolocator_windows_plugin.dll;C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/maps_launcher_plugin.dll;C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/permission_handler_windows_plugin.dll;C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/url_launcher_windows_plugin.dll")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug" TYPE FILE FILES
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/cloud_firestore/cloud_firestore_plugin.lib"
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/file_selector_windows/file_selector_windows_plugin.dll"
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/firebase_auth/firebase_auth_plugin.lib"
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/firebase_core/firebase_core_plugin.lib"
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/firebase_storage/firebase_storage_plugin.lib"
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/geolocator_windows/geolocator_windows_plugin.dll"
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/maps_launcher/maps_launcher_plugin.dll"
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/permission_handler_windows/permission_handler_windows_plugin.dll"
    "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/plugins/url_launcher_windows/url_launcher_windows_plugin.dll"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
  file(REMOVE_RECURSE "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/data/flutter_assets")
  
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/data/flutter_assets")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/data" TYPE DIRECTORY FILES "C:/Users/HP_Demo/vet_bookr_original/build//flutter_assets")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee]|[Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
        message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
        message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
file(INSTALL DESTINATION "C:/Users/HP_Demo/vet_bookr_original/windows/out/install/x64-Debug/data" TYPE FILE FILES "C:/Users/HP_Demo/vet_bookr_original/build/windows/app.so")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee]|[Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Users/HP_Demo/vet_bookr_original/windows/out/build/x64-Debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
