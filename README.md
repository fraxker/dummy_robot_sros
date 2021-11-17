# dummy_robot_sros

This repo is a example sros configuration for the ros demo `dummy_robot`. 
This configuration implements both authentication and access control for the nodes launched by the `dummy_robot_bringup` launch files.

## Usage

Keys and permissions can be generated using the `setup.sh` script.

After generation, run
```sh
ros2 launch dummy_robot_bringup dummy_robot_bringup_launch.xml
```
to launch the demo.