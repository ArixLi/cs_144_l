# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "F:\CLion\CLion 2021.2.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "F:\CLion\CLion 2021.2.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = F:\CS\CS144\sponge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = F:\CS\CS144\sponge\cmake-build-debug

# Include any dependencies generated for this target.
include tests/CMakeFiles/fsm_stream_reassembler_single.dir/depend.make
# Include the progress variables for this target.
include tests/CMakeFiles/fsm_stream_reassembler_single.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/fsm_stream_reassembler_single.dir/flags.make

tests/CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.obj: tests/CMakeFiles/fsm_stream_reassembler_single.dir/flags.make
tests/CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.obj: tests/CMakeFiles/fsm_stream_reassembler_single.dir/includes_CXX.rsp
tests/CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.obj: ../tests/fsm_stream_reassembler_single.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=F:\CS\CS144\sponge\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.obj"
	cd /d F:\CS\CS144\sponge\cmake-build-debug\tests && F:\MinGW\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\fsm_stream_reassembler_single.dir\fsm_stream_reassembler_single.cc.obj -c F:\CS\CS144\sponge\tests\fsm_stream_reassembler_single.cc

tests/CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.i"
	cd /d F:\CS\CS144\sponge\cmake-build-debug\tests && F:\MinGW\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E F:\CS\CS144\sponge\tests\fsm_stream_reassembler_single.cc > CMakeFiles\fsm_stream_reassembler_single.dir\fsm_stream_reassembler_single.cc.i

tests/CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.s"
	cd /d F:\CS\CS144\sponge\cmake-build-debug\tests && F:\MinGW\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S F:\CS\CS144\sponge\tests\fsm_stream_reassembler_single.cc -o CMakeFiles\fsm_stream_reassembler_single.dir\fsm_stream_reassembler_single.cc.s

# Object files for target fsm_stream_reassembler_single
fsm_stream_reassembler_single_OBJECTS = \
"CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.obj"

# External object files for target fsm_stream_reassembler_single
fsm_stream_reassembler_single_EXTERNAL_OBJECTS =

tests/fsm_stream_reassembler_single.exe: tests/CMakeFiles/fsm_stream_reassembler_single.dir/fsm_stream_reassembler_single.cc.obj
tests/fsm_stream_reassembler_single.exe: tests/CMakeFiles/fsm_stream_reassembler_single.dir/build.make
tests/fsm_stream_reassembler_single.exe: tests/libspongechecks.a
tests/fsm_stream_reassembler_single.exe: libsponge/libsponge.a
tests/fsm_stream_reassembler_single.exe: tests/CMakeFiles/fsm_stream_reassembler_single.dir/linklibs.rsp
tests/fsm_stream_reassembler_single.exe: tests/CMakeFiles/fsm_stream_reassembler_single.dir/objects1.rsp
tests/fsm_stream_reassembler_single.exe: tests/CMakeFiles/fsm_stream_reassembler_single.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=F:\CS\CS144\sponge\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable fsm_stream_reassembler_single.exe"
	cd /d F:\CS\CS144\sponge\cmake-build-debug\tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\fsm_stream_reassembler_single.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/fsm_stream_reassembler_single.dir/build: tests/fsm_stream_reassembler_single.exe
.PHONY : tests/CMakeFiles/fsm_stream_reassembler_single.dir/build

tests/CMakeFiles/fsm_stream_reassembler_single.dir/clean:
	cd /d F:\CS\CS144\sponge\cmake-build-debug\tests && $(CMAKE_COMMAND) -P CMakeFiles\fsm_stream_reassembler_single.dir\cmake_clean.cmake
.PHONY : tests/CMakeFiles/fsm_stream_reassembler_single.dir/clean

tests/CMakeFiles/fsm_stream_reassembler_single.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" F:\CS\CS144\sponge F:\CS\CS144\sponge\tests F:\CS\CS144\sponge\cmake-build-debug F:\CS\CS144\sponge\cmake-build-debug\tests F:\CS\CS144\sponge\cmake-build-debug\tests\CMakeFiles\fsm_stream_reassembler_single.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/fsm_stream_reassembler_single.dir/depend
