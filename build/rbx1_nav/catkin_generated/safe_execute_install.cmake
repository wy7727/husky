execute_process(COMMAND "/home/ying/wy_ws/build/rbx1_nav/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/ying/wy_ws/build/rbx1_nav/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
