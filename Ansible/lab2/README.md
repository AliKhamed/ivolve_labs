## Lab2 Description 

Ansible Playbooks for Web Server Configuration Objective: Write an Ansible playbook to automate the configuration of a web server. Configure Apache/Nginx, deploy a sample website and ensure proper security settings.

### playbook.yaml file
```
---
- 
  name: Install Nginx and start it
  hosts: servers
  become: true
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: latest 
    - name: Ensure nginx is running
      systemd:
        name: nginx
        state: started
        enabled: yes

    - name: Move index.html
      copy: 
        src: index.html
        dest: /var/www/html/index.html
        mode: '0755'
        remote_src: false

    - name: Enable Nginx service
      systemd:
        name: nginx
        daemon_reload: yes
        enabled: yes
        state: started

```

## Lab2 Outputs
### Run: ansible-playbook playbook.yaml

![](https://github.com/AliKhamed/ivolve_labs/blob/main/Ansible/screenshots/lab2.png)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/Ansible/screenshots/lab2.2.png)



