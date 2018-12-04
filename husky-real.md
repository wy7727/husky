
### 1动捕系统
-　optitrack 动捕系统:
1. run motive;
2. set parameter:https://v20.wiki.optitrack.com/index.php?title=Quick_Start_Guide:_Getting_Started
<br>校准系统，校准棒
<br>平面校准(校准棒的电池需要重新找)
<br>刚体检（反光标志没找到）
<br>运动，设置发送消息，电脑接收消息：mocap_optitrack:http://wiki.ros.org/mocap_optitrack

### ２mocap反馈函数
- 把原先husky节点发布的话题重映射到其他话题:在husky_base.launch文件的husky_node节点下添加以下代码
    <br>&lt;remap from="husky_velocity_controller/odom" to="tim"/>

- 创建package:catkin create pkg --catkin-deps roscpp rospy std_msgs nav_msgs geometry_msgs -- mocap_refe(注意依赖项)
- 创建mocap_ref.cpp
1. 发布消息到/husky_velocity_controller/odom话题
<br>消息类型：nav_msgs/Odometry:
<br>包含#include <nav_msgs/Odometry.h>
<br>ros::Publisher odom_pub = n.advertise<nav_msgs::Odometry>("/husky_velocity_controller/odom", 1000);
<br>消息定义：

	cb_time = ros::Time::now();
	nav_msgs::Odometry odom;
	odom.header.stamp = cb_time;
    odom.header.frame_id = "odom";
	odom.child_frame_id = "base_link";
	odom.pose.pose.position.x = msg->pose.position.x;
    odom.pose.pose.position.y = msg->pose.position.y;
    odom.pose.pose.position.z = msg->pose.position.z;
    odom.pose.pose.orientation.x = msg->pose.orientation.x;
	odom.pose.pose.orientation.y = msg->pose.orientation.y;
	odom.pose.pose.orientation.z = msg->pose.orientation.z;
	odom.pose.pose.orientation.w = msg->pose.orientation.w;

	odom_pub.publish(odom);

# notice:可直接google消息类型，创建package时需要添加头文件，添加依赖项；
- 编写CMakeLists.txt
<br>添加以下代码至文件末端

    add_executable(mocap_refe src/mocap_refe.cpp)
    target_link_libraries(mocap_refe
    ${catkin_LIBRARIES}
    )

### 3 实际操作
1.　optitrack 发布话题消息：
- 构建刚体
选择全部标定点，点击右键选择构建刚体
- 发布刚体消息
<div align="center">
<img src="optitrack.png" />
    设置
</div>
2. odroid登录husky上的电脑：ssh ying@ying-Lenovo-S41-70
- 设置网络
    - 用命令　ifconfig 查看IP地址
    - 用命令　hostname　查看主机名字
    - 在电脑和odroid输入命令　sudo gedit /etc/hosts
    - 然后在hosts文件做如下修改
<div align="center">
<img src="网络设置.png" />
    设置
</div>
    - note:加入第三四行的　ip< tab >hostname
    - 输入下列命令重启网络：sudo /etc/init.d/networking restart
    - 需要安装ssh服务器：sudo apt-get install openssh-server
    - 然后输入：ssh username@hostname
3. 把车放到动捕系统下面:roslaunch mocap_refe mocap_tran.launch
- 编写launch文件
    - 启动husky_base base.launch与husky连接
    - roslaunch rbx1_nav fake_move_base_blank_map.launch打开move_base包
    - rosrun robot_navigation move_base_square发送目标点的程序
    - 打开mocap_optitrack　mocap.launch接受motive的/Robot_1/pose话题
    - rosrun mocap_refe mocap_refe订阅motive的/Robot_1/pose话题发送到husky_velocity_controller/odom
    - 代码如下
    <div align="center">
<img src="mocap_tran.png" />
    
</div>
