## Lab2 Description 

Create shell script file to sent alert to email when
disk usage threshold exceeds to amount of usages (e.g 90% , 80%)

```
#!/bin/bash

ALERT_THRESHOLD=5

RECIPIENT="alikhames010644@gmail.com"

# Check disk usage and send email alert if usage exceeds threshold
usage=$(df -H --output=pcent / | tail -n 1 | tr -d ' %')
if [ "$usage" -ge "$ALERT_THRESHOLD" ]; then
    echo "Disk usage is above $ALERT_THRESHOLD%" | mail -s "Disk Space Alert" "$RECIPIENT"
fi
```

## Lab2 Output

![](https://github.com/AliKhamed/ivolve_labs/blob/main/day1/screenshots/lab2.png)



## Lab3 Description 

Create shell script file to ping for ip server of 192.168.1.x and x = 0 to 255
when ping succeeded print "Server 192.168.1.x is up and running." 
otherwise print "Server 192.168.1.x is unreachable"

```
#!/bin/bash
SUB='192.168.1'
for IP in {0..255}; do
  if ping -c 1 ${SUB}.${IP} > /dev/null 2>&1; then
    echo "Server ${SUB}.${IP} is up and running."
  else
    echo "Server ${SUB}.${IP} is unreachable"
  fi
done

```
## Lab3 Output

![](https://github.com/AliKhamed/ivolve_labs/blob/main/day1/screenshots/lab3.png)

