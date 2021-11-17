#!/usr/bin/env bash
directoryx="$(dirname -- $(readlink -fn -- "$0"; echo x))"
DIRECTORY="${directoryx%x}"
KEYSTORE="sros/keystore"
NAMESPACE="dummy_robot_bringup"
POLICY="sros/policies"
POLICY_FILE="dummy_robot.policy.xml"

export ROS_SECURITY_KEYSTORE="$DIRECTORY/$KEYSTORE"
export ROS_SECURITY_ENABLE=true
export ROS_SECURITY_STRATEGY=Enforce

ros2 security create_keystore $KEYSTORE
ros2 security create_key $KEYSTORE "/$NAMESPACE/dummy_joint_states"
ros2 security create_key $KEYSTORE "/$NAMESPACE/robot_state_publisher"
ros2 security create_key $KEYSTORE "/$NAMESPACE/dummy_laser"
ros2 security create_key $KEYSTORE "/$NAMESPACE/dummy_map_server"
ros2 security create_key $KEYSTORE "/$NAMESPACE/rviz2"

ros2 security create_permission $KEYSTORE "/$NAMESPACE/dummy_joint_states" "$POLICY/$POLICY_FILE"
ros2 security create_permission $KEYSTORE "/$NAMESPACE/robot_state_publisher" "$POLICY/$POLICY_FILE"
ros2 security create_permission $KEYSTORE "/$NAMESPACE/dummy_laser" "$POLICY/$POLICY_FILE"
ros2 security create_permission $KEYSTORE "/$NAMESPACE/dummy_map_server" "$POLICY/$POLICY_FILE"
ros2 security create_permission $KEYSTORE "/$NAMESPACE/rviz2" "$POLICY/$POLICY_FILE"