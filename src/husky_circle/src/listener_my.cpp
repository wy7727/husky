#include <ros/ros.h>
#include <tf2_ros/transform_listener.h>
#include <geometry_msgs/TransformStamped.h>
#include <geometry_msgs/Twist.h>

int main(int argc, char** argv){
  ros::init(argc, argv, "my_tf2_listener");

  ros::NodeHandle node;
  ros::Publisher husky_vel =
    node.advertise<geometry_msgs::Twist>("husky_velocity_controller/cmd_vel", 10);

  tf2_ros::Buffer tfBuffer;
  tf2_ros::TransformListener tfListener(tfBuffer);

  ros::Rate rate(10.0);
  while (node.ok()){
    geometry_msgs::TransformStamped transformStamped;
    try{
      transformStamped = tfBuffer.lookupTransform("base_link", "carrot1",
                               ros::Time(0));
    }
    catch (tf2::TransformException &ex) {
      ROS_WARN("%s",ex.what());
      ros::Duration(1.0).sleep();
      continue;
    }

    geometry_msgs::Twist vel_msg;
   
    vel_msg.angular.z = (atan2(transformStamped.transform.translation.y,
                                transformStamped.transform.translation.x) > 0.01) ? 1.0 * atan2(transformStamped.transform.translation.y, transformStamped.transform.translation.x) : 0 ;
    vel_msg.linear.x = (sqrt(pow(transformStamped.transform.translation.x, 2) +
                             pow(transformStamped.transform.translation.y, 2)) > 0.01) ? 0.5 * sqrt(pow(transformStamped.transform.translation.x, 2) + pow(transformStamped.transform.translation.y, 2)) : 0;
    husky_vel.publish(vel_msg);

    rate.sleep();
  }
  return 0;
};
