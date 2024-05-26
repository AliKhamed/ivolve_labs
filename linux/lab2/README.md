## Lab2 Description 

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
## Lab2 Output

![](https://github.com/AliKhamed/ivolve_labs/blob/main/day1/screenshots/lab3.png)

