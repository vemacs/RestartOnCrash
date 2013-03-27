RestartOnCrash
==============

This is designed to be used with [minecraft-init](https://github.com/Ahtenus/minecraft-init).

However, it is easily tweaked (just change the restart command).

Configuration
-------------

* server_path: where crash-reports is located
* restart_command: command that should be run on crash detection
* check_seconds: how many seconds until next check, the default of 15 is good

To use (be sure to configure it first)
--------------------------------------

    wget https://raw.github.com/vemacs/RestartOnCrash/master/roc.sh
    chmod +x roc.sh
    screen -S roc
    ./roc.sh
