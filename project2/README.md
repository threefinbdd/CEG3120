# Project 2:  Working with VPC

## Kanban Board
https://github.com/BDDave-Student/dave-ceg3120-student/projects/1

## Resources
- http://phpldapadmin.sourceforge.net/wiki/index.php/Main_Page
- https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-an-ubuntu-14-04-server

## Files changed to configure PHPLDAPADMIN
Configure phpldapadmin apache related config file to IP or DNS given name
- /etc/phpldapadmin/config.php
- /etc/phpldapadmin/apache.conf  

Create a directory to store certificate created using OpenSSL
- sudo mkdir /etc/apache2/ssl  
- sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

Enable Apache2 Module for SSL
- sudo a2enmod ssl

Utilized systemctl to manage Error in config files at specified lines
- /etc/apache2/sites-enabled/000-default.conf
- /etc/apache2/sites-enabled/default-ssl.conf
  - sudo a2ensite default-ssl.conf: Link sites-available/ to sites-enabled/ to modify config file
- sudo service apache2 restart
  - reload apache2 service to enable changes
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
- It Works!
![It works!](images/project2-apache-itworks.PNG)
