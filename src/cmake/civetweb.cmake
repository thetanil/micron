cmake_minimum_required(VERSION 3.0.0)
include(ExternalProject)

set(EX_PROJECT civetweb)
set(BUILD_CIVET_DIR ${CMAKE_SOURCE_DIR}/build/civet)
set(CIVET_DL_DIR ${BUILD_CIVET_DIR}/dl)
set(CIVET_DESTINATION_DIR ${BUILD_CIVET_DIR}/install)
set(CIVET_LIB_DIR ${CIVET_DESTINATION_DIR}/lib)
set(CIVET_INCLUDE_DIR ${CIVET_DESTINATION_DIR}/include)

ExternalProject_Add(
    ${EX_PROJECT}

    PREFIX            ${BUILD_CIVET_DIR}
    TMP_DIR           ${BUILD_CIVET_DIR}/temp
    STAMP_DIR         ${BUILD_CIVET_DIR}/stamp


    #--Download step--------------
    DOWNLOAD_DIR      ${BUILD_CIVET_DIR}/download
    URL                 https://github.com/civetweb/civetweb/archive/v1.12.zip
    UPDATE_COMMAND      ""
    #--Configure step-------------
    INSTALL_DIR       ${BUILD_CIVET_DIR}/install
    SOURCE_DIR        ${BUILD_CIVET_DIR}/source
    CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
                      -DCIVETWEB_ENABLE_WEBSOCKETS=ON
                      -DCIVETWEB_BUILD_TESTING=OFF
                      -DCIVETWEB_ENABLE_SSL=OFF
                      -DCIVETWEB_ENABLE_LUA=OFF
                      -DCIVETWEB_ENABLE_DUKTAPE=OFF
                      -DCIVETWEB_ENABLE_MEMORY_DEBUGGING=OFF
                      -DCIVETWEB_ENABLE_ASAN=OFF
                      -DBUILD_SHARED_LIBS=OFF
    #--Build step-----------------
    BINARY_DIR        ${BUILD_CIVET_DIR}/build
    BUILD_COMMAND     ${CMAKE_COMMAND} --build .
    #--Install step---------------
)

set_property(TARGET ${EX_PROJECT} PROPERTY C_STANDARD 99)