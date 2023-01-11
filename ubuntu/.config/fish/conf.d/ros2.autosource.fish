function ros2Source --on-variable PWD
    status --is-command-substitution; and return
    if test -e "./install/COLCON_IGNORE"; and test -e "./install/setup.bash"
        bass source install/setup.bash
        echo "Configured the folder as a workspace"
    end
end
