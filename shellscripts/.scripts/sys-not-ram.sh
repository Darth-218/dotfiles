ram=$(free -h | grep Mem | awk '{print "Used: "($3)"\nTotal: "($2)"\nAvailable: "($7)}')

notify-send -a "Ram:" "$ram"
