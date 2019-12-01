# husky绕圈
- debug list
- 安装sudo apt-get install ros-kinetic-navigation
- tf错误：

- husky gazebo:出现问题一般都是装差了什么东西，所以用sudo apt-get install ros-kinetic-　可以解决

- move_base按教程走的包第二部打不开move_base,要用rbx1的包。

- 第四步发送目标点的就是在cpp文件里发送机器人的目标点位置以及在该点的位姿。

#### 仿真
- 1 roslaunch husky_gazebo husky_empty_world.launch 
- 打开husky的gazebo仿真
- husky的包可在github上面下载，
- husky gazebo:出现问题一般都是装差了什么东西，所以用sudo apt-get install ros-kinetic-　可以解决
- 运行的时候出现为
- problem:gazebo warn:controller spawner...controller_manager;
- answer:1sudo apt-get install ros-kinetic-ros-control;2 sudo apt-get install ros-kinetic-gazebo-ros-control; *3 sudo apt-get install ros-kinetic-ros-controllers;
- 2 roslaunch rbx1_nav fake_move_base_blank_map.launch 
- rbx1这个包可打开move_base节点，但这个包是在网上下载的，与move_base教程不一样。
- 需要安装sudo apt-get install ros-kinetic-navigation，manigation_msg等，而且还有教程http://wiki.ros.org/navigation/Tutorials
- 而且百度上的move_base教程可能只是针对husky等一些特定的车，但并不针对另一类型的车，比如在运行ridgeright的仿真时，出现tferror:提示base_footprint不存在，处理方法是在fake_move_base_blank_map.launch中加入坐标广播，如下。所以可能自己创建move_base节点要参考navigation教程
- <node pkg="tf" type="static_transform_publisher" name="base_footprint_to_base_link" args="0.0 0.0 0.0 0 0 0.0 /base_link /base_footprint 100"/>

- 3 rviz 
- husky仿真输出的自身位置坐标odom可能不准确，但是在rivz才能准确观察机器人的坐标变化
- 4 rosrun robot_navigation move_base_square
- 第四步发送目标点的就是在cpp文件里发送机器人的目标点位置以及在该点的位姿

#### 实体机操作
- 动捕系统：把动捕系统得到的机器人的位姿发送给tf,替换点机器人自身测量的位置
- 把原先husky节点发布的话题（机器人自身测量的位置）重映射到其他话题:在husky_base.launch文件的husky_node节点下添加以下代码 
- <remap from="husky_velocity_controller/odom" to="tim"/>
- 把机器人动捕系统得出的机器人位姿话题重新发送到odom话题，替换掉机器人原先位置：创建mocap_ref.cpp


