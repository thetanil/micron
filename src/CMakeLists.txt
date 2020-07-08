cmake_minimum_required(VERSION 3.0.0)

# include(CTest)
# enable_testing()

# add_subdirectory(sqlite)
# include("sqlite/CMakeLists.txt")
# list(APPEND CMAKE_PREFIX_PATH "${PROJECT_SOURCE_DIR}/sqlite")
# message(${CMAKE_PREFIX_PATH})
# find_package(SQLite3 REQUIRED CONFIG)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
include(cmake/sqlite.cmake)
# include(${SQLITE_DIR}/temp/CMakeLists.txt)

add_executable(${PROJECT_NAME} main.c)
target_include_directories(${PROJECT_NAME} PUBLIC ${SQLITE_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} ${SQLITE_LIB_DIR}/sqlite3.lib)
# target_link_libraries(${PROJECT_NAME} SQLite::SQLite3)
# target_link_libraries(${PROJECT_NAME} sqlite3d.lib)
# message(${SQLITE_INCLUDE_DIR})

# set(CPACK_PROJECT_NAME ${PROJECT_NAME})
# set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
# include(CPack)
