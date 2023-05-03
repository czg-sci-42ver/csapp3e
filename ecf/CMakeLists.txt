cmake_minimum_required(VERSION 3.15...3.25)

project(MyProject
  VERSION
    1.0
  DESCRIPTION
    "Very nice project"
  LANGUAGES
    C
)

#set(LINKER_LANGUAGE C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
#add_compile_options(-g3 -Wall -v)
add_compile_options(-g3 -Wall)

## TODO change order of include path
include_directories(BEFORE SYSTEM ../include ../src)
#set(CMAKE_C_FLAGS 	"${CMAKE_C_FLAGS} -iquote")
# https://stackoverflow.com/questions/14306642/adding-multiple-executables-in-cmake
file( GLOB LIB_SOURCES ../src/*.c )
file( GLOB LIB_HEADERS ../include/*.h )
#message("LIB_HEADERS ${LIB_HEADERS} ")

add_library( YourLib SHARED ${LIB_SOURCES} ${LIB_HEADERS} )
#add_library( YourLib SHARED ../include/csapp.h ../src/csapp.c )
set_target_properties(YourLib PROPERTIES LINKER_LANGUAGE C)
#target_link_options(YourLib PRIVATE -shared -fpic -nostartfiles) 
target_link_options(YourLib PRIVATE -shared -fpic ) 

#file( GLOB APP_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} (?!fragments)*.c) # not supported https://stackoverflow.com/questions/68325947/cmake-negative-lookahead-regexp-support
file( GLOB APP_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.c)
#[[
weird "/usr/bin/ld: /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib/Scrt1.o: in function `_start':
(.text+0x1b): undefined reference to `main'" error
#file( GLOB APP_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.c)
]]
#string( REPLACE "fragments.c" "" APP_SOURCES ${APP_SOURCES} ) # will mistakenly see '' as testsourcefile
#message("My test's working directory: ${CMAKE_CURRENT_SOURCE_DIR}")
message("APP_SOURCES ${APP_SOURCES}")
#file( RELATIVE_PATH rel ${CMAKE_CURRENT_SOURCE_DIR} ${APP_SOURCES}) # keep seen as wrong parameter number
foreach( testsourcefile ${APP_SOURCES} )
    # I used a simple string replace, to cut off .cpp.
	#message("testsourcefile ${testsourcefile}")
	if( ${testsourcefile} MATCHES fragments.c|rfork.c)
		continue()
	endif()
    string( REPLACE ".c" "" testname ${testsourcefile} )
    add_executable( ${testname} ${testsourcefile} )
    # Make sure YourLib is linked to each app
	#target_include_directories( ${testname} INTERFACE ../include ../src)
    target_link_libraries( ${testname} YourLib )
endforeach()
