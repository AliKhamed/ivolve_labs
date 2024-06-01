## Lab3 Description 

Ansible Vault Objective: Use Ansible Vault to encrypt sensitive information, such as database passwords, and incorporate the encrypted data into an Ansible playbook.

### Create the Vault File Using The Following command: 
**ansible-vault create vault.yml**
### vault.yml contents 
```
   db_password: your_secure_password

```
### playbook.yaml file
```
- name: Install MySQL and create a database user
  hosts: servers
  vars_files:
    - vault.yml

  tasks:
    - name: Install MySQL server
      apt:
        name: mysql-server
        state: present
      notify: Start MySQL service

    - name: Ensure MySQL service is running
      service:
        name: mysql
        state: started
        enabled: yes

    - name: Install Python MySQL library
      apt:
        name: python3-mysqldb
        state: present

    - name: Create a MySQL user
      mysql_user:
        name: dbuser
        host: "%"
        password: "{{ db_password }}"
        priv: '*.*:CREATE,INSERT,UPDATE,DELETE,SELECT'
        state: present

  handlers:
    - name: Start MySQL service
      service:
        name: mysql
        state: started

```
## Running The Playbook
```
  ansible-playbook playbook.yaml --ask-vault-pass
  
```

## Lab3 Outputs

![](https://github.com/AliKhamed/ivolve_labs/blob/main/Ansible/screenshots/lab3.1.png)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/Ansible/screenshots/lab3.2.png)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/Ansible/screenshots/lab3.3.png)



