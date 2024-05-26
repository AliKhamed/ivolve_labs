## Lab1 Description 

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

## Lab1 Output

![](https://github.com/AliKhamed/ivolve_labs/blob/main/linux/screenshots/lab2.png)



