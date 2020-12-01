## Resources
- Load Balancing:  https://www.digitalocean.com/community/tutorials/how-to-use-haproxy-to-set-up-http-load-balancing-on-an-ubuntu-vps

## Load Balancer Configuration
1) Set up 3 instances with package install of apache2
2) Set up 1 of 3 instance with package install of haproxy
3) Designate hostname to 2 web server instances
4) Configure /etc/haproxy/haproxy.conf file
  a) global variables, default variables, frontend, backend
5) Enable ssh communication
  a) Create private key placed on proxy server
  b) Create public key placed on web servers' .ssh/authorized_keys

## Today

## 30/11/2020
- TODO: Quietly produce public/private keypairs
- TODO:  sftp put key into git-server and ldap-server's authorized_keys
- Implemented index.html for all 3 servers
- Cleaned up YAML comments causing template to break
- Tested SFTP to transfer from Proxy to Git server
![trial image](images/project2-sftp-trial.PNG)
- Configured YAML template for 2 webserver instances and 1 haproxy instance (project2/CloudFormations/CEG3120-Instance-Template2.YML)
  - Security Group:  22 & 80 from External Network and Private Network Addresses
  - Ubuntu3IPAddress:
  - Ubuntu3Instance:
    - includes apt install haproxy