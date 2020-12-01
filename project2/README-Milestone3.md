## Today

## 30/11/2020
- TODO: Quietly produce public/private keypairs
- TODO:  sftp put key into git-server and ldap-server's authorized_keys
- 
- Implemented index.html for all 3 servers
- Cleaned up YAML comments causing template to break
- Tested SFTP to transfer from Proxy to Git server
![trial image](images/project2-sftp-trial.PNG)
- Configured YAML template for 2 webserver instances and 1 haproxy instance (project2/CloudFormations/CEG3120-Instance-Template2.YML)
  - Security Group:  22 & 80 from External Network and Private Network Addresses
  - Ubuntu3IPAddress:
  - Ubuntu3Instance:
    - includes apt install haproxy
