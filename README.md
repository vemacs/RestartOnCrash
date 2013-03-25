RestartOnCrash
==============

This is designed to be used with [minecraft-init](https://github.com/Ahtenus/minecraft-init).

However, it is easily tweaked (just change the say and restart commands).

Configuration
-------------

* server_path: where crash-reports is located
* restart_command: command that should be run on crash detection
* say_command: say command that should be run on crash detection

To use (be sure to configure it first)
--------------------------------------

    wget https://raw.github.com/vemacs/RestartOnCrash/master/roc.sh
    screen -S roc
    ./roc.sh
