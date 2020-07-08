# SQLite
cmake_minimum_required(VERSION 3.0.0)
include(ExternalProject)

set(SQLITE_DIR ${CMAKE_SOURCE_DIR}/build/sqlite)
set(SQLITE_DESTINATION_DIR ${SQLITE_DIR}/install)
set(SQLITE_LIB_DIR ${SQLITE_DESTINATION_DIR}/lib)
set(SQLITE_INCLUDE_DIR ${SQLITE_DIR}/source)


# Add CMake project file
file(MAKE_DIRECTORY ${SQLITE_DIR}/temp)
file(WRITE ${SQLITE_DIR}/temp/CMakeLists.txt
    "cmake_minimum_required(VERSION 3.0.0)\n"
    "set(PROJECT_NAME sqlite)\n"
    "project(${PROJECT_NAME} VERSION 3.23.3)\n"
    "include_directories(${SQLITE_DIR}/source)\n"
    "add_library(sqlite3 ${SQLITE_DIR}/source/sqlite3.c)\n"
    "install(TARGETS sqlite3 DESTINATION lib)\n"
    "install(FILES sqlite3.h DESTINATION include)\n")



# Download, configure, build and install.
ExternalProject_Add(sqlite
    # DEPENDS
    PREFIX            ${SQLITE_DIR}
    TMP_DIR           ${SQLITE_DIR}/temp
    STAMP_DIR         ${SQLITE_DIR}/stamp
    #--Download step--------------
    DOWNLOAD_DIR      ${SFML_PREFIX}/download
	URL               https://www.sqlite.org/2020/sqlite-amalgamation-3320300.zip
	URL_HASH          SHA1=0c805bea134712a903290a26b2a61c3a8a3bd8cc
    #--Update/Patch step----------
    UPDATE_COMMAND    ${CMAKE_COMMAND} -E copy
                          ${SQLITE_DIR}/temp/CMakeLists.txt
                          ${SQLITE_DIR}/source/CMakeLists.txt
    #--Configure step-------------
    SOURCE_DIR        ${SQLITE_DIR}/source
    CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX:PATH=${SQLITE_DIR}/install
                    #   -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                    #   -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}
    #--Build step-----------------
    BINARY_DIR        ${SQLITE_DIR}/build
    BUILD_COMMAND     ${CMAKE_COMMAND} --build .
    #--Install step---------------
    INSTALL_DIR       ${SQLITE_DIR}/install
)