# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Applications/CMake 2.8-12.app/Contents/bin/cmake"

# The command to remove a file.
RM = "/Applications/CMake 2.8-12.app/Contents/bin/cmake" -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = "/Applications/CMake 2.8-12.app/Contents/bin/ccmake"

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/carsonpotter/Desktop/marsyas-0.4.8/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/carsonpotter/Desktop/marsyas-0.4.8/build

# Include any dependencies generated for this target.
include apps/aim/CMakeFiles/aim.dir/depend.make

# Include the progress variables for this target.
include apps/aim/CMakeFiles/aim.dir/progress.make

# Include the compile flags for this target's objects.
include apps/aim/CMakeFiles/aim.dir/flags.make

apps/aim/CMakeFiles/aim.dir/aim.cpp.o: apps/aim/CMakeFiles/aim.dir/flags.make
apps/aim/CMakeFiles/aim.dir/aim.cpp.o: /Users/carsonpotter/Desktop/marsyas-0.4.8/src/apps/aim/aim.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/carsonpotter/Desktop/marsyas-0.4.8/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/aim/CMakeFiles/aim.dir/aim.cpp.o"
	cd /Users/carsonpotter/Desktop/marsyas-0.4.8/build/apps/aim && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/aim.dir/aim.cpp.o -c /Users/carsonpotter/Desktop/marsyas-0.4.8/src/apps/aim/aim.cpp

apps/aim/CMakeFiles/aim.dir/aim.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/aim.dir/aim.cpp.i"
	cd /Users/carsonpotter/Desktop/marsyas-0.4.8/build/apps/aim && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/carsonpotter/Desktop/marsyas-0.4.8/src/apps/aim/aim.cpp > CMakeFiles/aim.dir/aim.cpp.i

apps/aim/CMakeFiles/aim.dir/aim.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/aim.dir/aim.cpp.s"
	cd /Users/carsonpotter/Desktop/marsyas-0.4.8/build/apps/aim && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/carsonpotter/Desktop/marsyas-0.4.8/src/apps/aim/aim.cpp -o CMakeFiles/aim.dir/aim.cpp.s

apps/aim/CMakeFiles/aim.dir/aim.cpp.o.requires:
.PHONY : apps/aim/CMakeFiles/aim.dir/aim.cpp.o.requires

apps/aim/CMakeFiles/aim.dir/aim.cpp.o.provides: apps/aim/CMakeFiles/aim.dir/aim.cpp.o.requires
	$(MAKE) -f apps/aim/CMakeFiles/aim.dir/build.make apps/aim/CMakeFiles/aim.dir/aim.cpp.o.provides.build
.PHONY : apps/aim/CMakeFiles/aim.dir/aim.cpp.o.provides

apps/aim/CMakeFiles/aim.dir/aim.cpp.o.provides.build: apps/aim/CMakeFiles/aim.dir/aim.cpp.o

# Object files for target aim
aim_OBJECTS = \
"CMakeFiles/aim.dir/aim.cpp.o"

# External object files for target aim
aim_EXTERNAL_OBJECTS =

bin/aim: apps/aim/CMakeFiles/aim.dir/aim.cpp.o
bin/aim: apps/aim/CMakeFiles/aim.dir/build.make
bin/aim: lib/libmarsyas.dylib
bin/aim: apps/aim/CMakeFiles/aim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/aim"
	cd /Users/carsonpotter/Desktop/marsyas-0.4.8/build/apps/aim && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/aim/CMakeFiles/aim.dir/build: bin/aim
.PHONY : apps/aim/CMakeFiles/aim.dir/build

apps/aim/CMakeFiles/aim.dir/requires: apps/aim/CMakeFiles/aim.dir/aim.cpp.o.requires
.PHONY : apps/aim/CMakeFiles/aim.dir/requires

apps/aim/CMakeFiles/aim.dir/clean:
	cd /Users/carsonpotter/Desktop/marsyas-0.4.8/build/apps/aim && $(CMAKE_COMMAND) -P CMakeFiles/aim.dir/cmake_clean.cmake
.PHONY : apps/aim/CMakeFiles/aim.dir/clean

apps/aim/CMakeFiles/aim.dir/depend:
	cd /Users/carsonpotter/Desktop/marsyas-0.4.8/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/carsonpotter/Desktop/marsyas-0.4.8/src /Users/carsonpotter/Desktop/marsyas-0.4.8/src/apps/aim /Users/carsonpotter/Desktop/marsyas-0.4.8/build /Users/carsonpotter/Desktop/marsyas-0.4.8/build/apps/aim /Users/carsonpotter/Desktop/marsyas-0.4.8/build/apps/aim/CMakeFiles/aim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/aim/CMakeFiles/aim.dir/depend
