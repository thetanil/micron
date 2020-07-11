cmake_minimum_required(VERSION 3.0.0)

# include(CTest)
# enable_testing()

set(CMAKE_C_STANDARD 99)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
include(cmake/sqlite.cmake)
include(cmake/civetweb.cmake)

add_executable(${PROJECT_NAME} civet.c)

add_dependencies(${PROJECT_NAME} sqlite)
set_property(TARGET sqlite PROPERTY C_STANDARD 99)
target_link_libraries(${PROJECT_NAME} ${SQLITE_LIB_DIR}/sqlite3.lib)
target_include_directories(${PROJECT_NAME} PUBLIC ${SQLITE_INCLUDE_DIR})

add_dependencies(${PROJECT_NAME} civetweb)
set_property(TARGET civetweb PROPERTY C_STANDARD 99)
target_link_libraries(${PROJECT_NAME} ${CIVET_LIB_DIR}/civetweb.lib)
target_include_directories(${PROJECT_NAME} PUBLIC ${CIVET_INCLUDE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${BUILD_CIVET_DIR}/source/src)

# set(CPACK_PROJECT_NAME ${PROJECT_NAME})
# set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
# include(CPack)
