#include <ros/ros.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <nav_msgs/Odometry.h>


std::string turtle_name;

void poseCallback(const nav_msgs::Odometry::ConstPtr& msg){
  static tf2_ros::TransformBroadcaster br;
  geometry_msgs::TransformStamped transformStamped;
  
  transformStamped.header.stamp = ros::Time::now();
  transformStamped.header.frame_id = "world";
  transformStamped.child_frame_id = "odom";
  transformStamped.transform.translation.x = msg->pose.pose.position.x;
  transformStamped.transform.translation.y = msg->pose.pose.position.y;
  transformStamped.transform.translation.z = 0.0;
  tf2::Quaternion q;
  q.setRPY(0, 0, msg->pose.pose.orientation.z);
  transformStamped.transform.rotation.x = q.x();
  transformStamped.transform.rotation.y = q.y();
  transformStamped.transform.rotation.z = q.z();
  transformStamped.transform.rotation.w = q.w();

  br.sendTransform(transformStamped);
}

int main(int argc, char** argv){
  ros::init(argc, argv, "my_tf2_broadcaster");

  ros::NodeHandle private_node("~");
 // if (! private_node.hasParam("turtle"))
 // {
 //   if (argc != 2){ROS_ERROR("need turtle name as argument"); return -1;};
 //   turtle_name = argv[1];
//  }
//  else
//  {
//    private_node.getParam("turtle", turtle_name);
//  }
    
  ros::NodeHandle node;
  ros::Subscriber sub = node.subscribe("/husky_velocity_controller/odom", 10, &poseCallback);

  ros::spin();
  return 0;
};
