cmake_minimum_required (VERSION 3.0 FATAL_ERROR)
project (py-leveldb)

## include & link to leveldb (depending on boost):
include_directories($ENV{LEVELDB_INCLUDE_DIR})
link_directories($ENV{LEVELDB_LIBRARY_DIR})
link_libraries($ENV{LEVELDB_LIBRARY})

## include & link PythonLibs
find_package(PythonLibs 2 REQUIRED)
include_directories(${PYTHON_INCLUDE_DIRS})
link_libraries(${PYTHON_LIBRARIES})


# Add files :
file(GLOB SRC_FILES "*.cc")
file(GLOB INC_FILES "*.h")
file(GLOB DEF_FILES "*.def")

message("Source .cc files : ${SRC_FILES}")
message("Source .h files : ${INC_FILES}")
message("Source .def files : ${DEF_FILES}")

add_definitions("-DDLL_BUILD")
add_library( leveldb SHARED ${SRC_FILES} ${INC_FILES} ${DEF_FILES})
set_target_properties(leveldb PROPERTIES SUFFIX ".pyd")
	
install(TARGETS leveldb DESTINATION . )


