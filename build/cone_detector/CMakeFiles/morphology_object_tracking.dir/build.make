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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/scuak/rmv4/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/scuak/rmv4/build

# Include any dependencies generated for this target.
include cone_detector/CMakeFiles/morphology_object_tracking.dir/depend.make

# Include the progress variables for this target.
include cone_detector/CMakeFiles/morphology_object_tracking.dir/progress.make

# Include the compile flags for this target's objects.
include cone_detector/CMakeFiles/morphology_object_tracking.dir/flags.make

cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o: cone_detector/CMakeFiles/morphology_object_tracking.dir/flags.make
cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o: /home/scuak/rmv4/src/cone_detector/src/morphology_object_tracking.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/scuak/rmv4/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o"
	cd /home/scuak/rmv4/build/cone_detector && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o -c /home/scuak/rmv4/src/cone_detector/src/morphology_object_tracking.cpp

cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.i"
	cd /home/scuak/rmv4/build/cone_detector && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/scuak/rmv4/src/cone_detector/src/morphology_object_tracking.cpp > CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.i

cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.s"
	cd /home/scuak/rmv4/build/cone_detector && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/scuak/rmv4/src/cone_detector/src/morphology_object_tracking.cpp -o CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.s

cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o.requires:
.PHONY : cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o.requires

cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o.provides: cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o.requires
	$(MAKE) -f cone_detector/CMakeFiles/morphology_object_tracking.dir/build.make cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o.provides.build
.PHONY : cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o.provides

cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o.provides.build: cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o

# Object files for target morphology_object_tracking
morphology_object_tracking_OBJECTS = \
"CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o"

# External object files for target morphology_object_tracking
morphology_object_tracking_EXTERNAL_OBJECTS =

/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: cone_detector/CMakeFiles/morphology_object_tracking.dir/build.make
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libcv_bridge.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libtf_conversions.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libkdl_conversions.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/liborocos-kdl.so.1.3.0
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libimage_transport.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libclass_loader.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/libPocoFoundation.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libdl.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libroslib.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libtf.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libtf2_ros.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libactionlib.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libmessage_filters.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libroscpp.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libxmlrpcpp.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libtf2.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libroscpp_serialization.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/librosconsole.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/librosconsole_log4cxx.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/librosconsole_backend_interface.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/liblog4cxx.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/librostime.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /opt/ros/jade/lib/libcpp_common.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking: cone_detector/CMakeFiles/morphology_object_tracking.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking"
	cd /home/scuak/rmv4/build/cone_detector && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/morphology_object_tracking.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
cone_detector/CMakeFiles/morphology_object_tracking.dir/build: /home/scuak/rmv4/devel/lib/cone_detector/morphology_object_tracking
.PHONY : cone_detector/CMakeFiles/morphology_object_tracking.dir/build

cone_detector/CMakeFiles/morphology_object_tracking.dir/requires: cone_detector/CMakeFiles/morphology_object_tracking.dir/src/morphology_object_tracking.cpp.o.requires
.PHONY : cone_detector/CMakeFiles/morphology_object_tracking.dir/requires

cone_detector/CMakeFiles/morphology_object_tracking.dir/clean:
	cd /home/scuak/rmv4/build/cone_detector && $(CMAKE_COMMAND) -P CMakeFiles/morphology_object_tracking.dir/cmake_clean.cmake
.PHONY : cone_detector/CMakeFiles/morphology_object_tracking.dir/clean

cone_detector/CMakeFiles/morphology_object_tracking.dir/depend:
	cd /home/scuak/rmv4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/scuak/rmv4/src /home/scuak/rmv4/src/cone_detector /home/scuak/rmv4/build /home/scuak/rmv4/build/cone_detector /home/scuak/rmv4/build/cone_detector/CMakeFiles/morphology_object_tracking.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : cone_detector/CMakeFiles/morphology_object_tracking.dir/depend

