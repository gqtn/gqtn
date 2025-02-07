# Apache

1. Open Apache Config File

> CentOS or Fedora
    `$ sudo nano /etc/httpd/conf/httpd.conf`
				
> Ubuntu or Debian
    `$ sudo nano /etc/apache2/ports.conf`
				
				
2. Change Apache Port Number
```
    Listen 80 
    To: "Listen 8080" or "Listen8080"
			
    Listen 443
    To "Listen 8443" or "Listen8443"
```			

3. Open Virtual Host Configuration (for Ubuntu/Debian)
```
	$ sudo nano /etc/apache2/sites-enabled/mysite.conf
	$ sudo nano /etc/apache2/sites-enabled/000-default.conf
```

4. Change the line:
```
    <VirtualHost: *:80>
    To: ""VirtualHost: *:8080>"
```			

5. Restart Apache Server:
```
	$ sudo systemctl restart apache2
	#SystemD
				
	$ sudo service apache2 restart
	#SysVInit
```
