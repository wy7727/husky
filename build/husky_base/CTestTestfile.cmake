# CMake generated Testfile for 
# Source directory: /home/ying/wy_ws/src/husky/husky_base
# Build directory: /home/ying/wy_ws/build/husky_base
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_husky_base_roslaunch-check_launch "/home/ying/wy_ws/build/husky_base/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/ying/wy_ws/build/husky_base/test_results/husky_base/roslaunch-check_launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/ying/wy_ws/build/husky_base/test_results/husky_base" "/opt/ros/kinetic/share/roslaunch/cmake/../scripts/roslaunch-check -o '/home/ying/wy_ws/build/husky_base/test_results/husky_base/roslaunch-check_launch.xml' '/home/ying/wy_ws/src/husky/husky_base/launch' ")
subdirs(gtest)
