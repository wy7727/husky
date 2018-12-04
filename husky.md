
tf:
<div align="center">
<img src="husky.png" />
    流程图
</div>

  代码分析：
  <br>一　动态坐标广播
  <br><br>ros::Subscriber sub = node.subscribe("/husky_velocity_controller/odom", 10, &poseCallback);
  <br>订阅/husky_velocity_controller/odom后，执行callback函数poseCallback；
  <br>
  <br>void poseCallback(const nav_msgs::Odometry::ConstPtr& msg){
  <br>static tf2_ros::TransformBroadcaster br;
  <br>geometry_msgs::TransformStamped transformStamped;
  <br>
  <br>transformStamped.header.stamp = ros::Time::now();
  <br>transformStamped.header.frame_id = "world";
  <br>transformStamped.child_frame_id = "odom";
  <br>transformStamped.transform.translation.x = msg->pose.pose.position.x;
  <br>transformStamped.transform.translation.y = msg->pose.pose.position.y;
  <br>transformStamped.transform.translation.z = 0.0;
  <br>tf2::Quaternion q;
  <br>q.setRPY(0, 0, msg->pose.pose.orientation.z);
  <br>transformStamped.transform.rotation.x = q.x();
  <br>transformStamped.transform.rotation.y = q.y();
  <br>transformStamped.transform.rotation.z = q.z();
  <br>transformStamped.transform.rotation.w = q.w();
  <br>
  <br>br.sendTransform(transformStamped);
  <br>}
  <br> const nav_msgs::Odometry::ConstPtr& msg自动获取话题odom的消息类型；

  <br>br.sendTransform(transformStamped);把tf消息类型发出去；
  <br>二　接收坐标广播
  <br>transformStamped = tfBuffer.lookupTransform("base_link", "carrot1",
                               ros::Time(0));
  <br>参考坐标和husky坐标之间的转换

  <br>vel_msg.angular.z = (atan2(transformStamped.transform.translation.y,transformStamped.transform.translation.x) > 0.01) ? 1.0 *atan2(transformStamped.transform.translation.y, transformStamped.transform.translation.x) : 0 ;
   <br> vel_msg.linear.x = (sqrt(pow(transformStamped.transform.translation.x, 2)+pow(transformStamped.transform.translation.y, 2)) > 0.01) ? 0.5 * sqrt(pow(transformStamped.transform.translation.x, 2) + pow(transformStamped.transform.translation.y, 2)) : 0;
    <br>husky_vel.publish(vel_msg);
<br>把机器人的速度信息发送到话题husky_velocity_controller/cmd_vel    


move base: 1 roslaunch husky_gazebo husky_empty_world.launch 
<br>       2 roslaunch rbx1_nav fake_move_base_blank_map.launch 
<br>       3 rviz
<br>       4 rosrun robot_navigation move_base_square
     

husky小车：
<br>１安装husky：sudo apt-get ros-kinetic-husky*                                                           <br>      2 运行husky_base base.launch


odroid:<br>1下载镜像文件至sd卡，开机；<br>2安装ros,husky，rbx1_nav,robot_navigation;<br>3 problem:gazebo warn:controller spawner...controller_manager;<br>answer:1sudo apt-get install ros-kinetic-ros-control;2 sudo apt-get install ros-kinetic-gazebo-ros-control; *3 sudo apt-get install ros-kinetic-ros-controllers;


