# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ying/wy_ws/src/mocap_optitrack

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ying/wy_ws/build/mocap_optitrack

# Utility rule file for _run_tests_mocap_optitrack_roslaunch-check_launch.

# Include the progress variables for this target.
include CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/progress.make

CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch:
	catkin_generated/env_cached.sh /usr/bin/python /opt/ros/kinetic/share/catkin/cmake/test/run_tests.py /home/ying/wy_ws/build/mocap_optitrack/test_results/mocap_optitrack/roslaunch-check_launch.xml "/usr/bin/cmake -E make_directory /home/ying/wy_ws/build/mocap_optitrack/test_results/mocap_optitrack" "/opt/ros/kinetic/share/roslaunch/cmake/../scripts/roslaunch-check -o '/home/ying/wy_ws/build/mocap_optitrack/test_results/mocap_optitrack/roslaunch-check_launch.xml' '/home/ying/wy_ws/src/mocap_optitrack/launch' "

_run_tests_mocap_optitrack_roslaunch-check_launch: CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch
_run_tests_mocap_optitrack_roslaunch-check_launch: CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/build.make

.PHONY : _run_tests_mocap_optitrack_roslaunch-check_launch

# Rule to build all files generated by this target.
CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/build: _run_tests_mocap_optitrack_roslaunch-check_launch

.PHONY : CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/build

CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/cmake_clean.cmake
.PHONY : CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/clean

CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/depend:
	cd /home/ying/wy_ws/build/mocap_optitrack && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ying/wy_ws/src/mocap_optitrack /home/ying/wy_ws/src/mocap_optitrack /home/ying/wy_ws/build/mocap_optitrack /home/ying/wy_ws/build/mocap_optitrack /home/ying/wy_ws/build/mocap_optitrack/CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/_run_tests_mocap_optitrack_roslaunch-check_launch.dir/depend

