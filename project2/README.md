# Project 2:  Working with VPC

## Kanban Board
https://github.com/BDDave-Student/dave-ceg3120-student/projects/1

## Resources
- http://phpldapadmin.sourceforge.net/wiki/index.php/Main_Page
- https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-an-ubuntu-14-04-server

## Today

## 6/11/2020
- Add information about LDAPserver domain name to define LDAPServer and set up redirects to point all HTTP requests to the HTTPS interface  
![configure apache HTTP](images/project2-apache-configHTTP.PNG)  
![configure apache HTTPS](images/project2-apache-configHTTPS-DNS.PNG)
![configure apache cert](images/project2-apache-configHTTPS-cert.PNG)

- Configured apache.conf to reduce bot attacks on URL location:  /bdd-super (new)
- Created SSL Certificate  
![SSL-cert](images/project2-sslcert.PNG)
- Configuration of phpldapadmin config file
  - setValue for host is elastic IP
  - setValue for base is DNS
  - setValue for bind_ID is admin, DNS
  - setValue for timeout
  - custom config set for Hide_Template_Warning
- Installed phpldapadmin tools to LDAP server  
![phpldapadmin install](images/project2-phpldapadmins-install.PNG)
- Configured Security Group to include All Traffic Inbound from Home IP
