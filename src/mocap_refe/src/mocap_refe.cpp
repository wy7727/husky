#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <gazebo_msgs/ModelStates.h>
#include <mavros_msgs/State.h>
#include <mavros_msgs/CommandTOL.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Int8.h>
#include <nav_msgs/Odometry.h>

ros::Time cb_time;



ros::Publisher odom_pub;
ros::Subscriber mocap_receiver;


void mocap_optitrack_cb(const geometry_msgs::PoseStamped::ConstPtr& msg)
{
	ROS_INFO("received mocap pose");
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
}



int main(int argc, char** argv)
{
	ros::init(argc,argv,"mocap_refe");
	ros::NodeHandle n;
	
	
	odom_pub = n.advertise<nav_msgs::Odometry>("/husky_velocity_controller/odom",1000);
	mocap_receiver = n.subscribe("/Robot_1/pose",1000,mocap_optitrack_cb);
	

	ros::spin();
	return 0;

}
