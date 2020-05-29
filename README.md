this readme file is included in all the projects and shows how to run and add the project aswell as showing some of the features off incase of not being able to get the website running, they are recorded in differant parts

watch part 1 install the database
https://youtu.be/sMNZNDYANw4

watch part 2 configure website
https://youtu.be/kIOo00JDgn8

optional part 3 discussion of project
https://youtu.be/ZbJ9u0MKZCk

optional part 4 showing the back end
https://youtu.be/WQ3MJWZNDoQ

part 5 mobile , backend still needed some fixes at recording stage
https://youtu.be/EvNX-Wy5EYk


OR follow written instructions bellow to install the website


install xampp

https://www.apachefriends.org/download.html

copy across website to htdocs
D:\xampp\htdocs

htdocs should now contain 
D:\xampp\htdocs\laravel

edit vhosts
D:\xampp\apache\conf\extra

remove ## from line
##NameVirtualHost *:80

so that it looks like
NameVirtualHost *:80

add this anywhere in the file, make sure directories are correct,
mine is installed on d drive

<VirtualHost *:80>
    DocumentRoot "D:/xampp/htdocs/laravel/public"
    ServerName aquarama
</VirtualHost>


edit hosts

open as administrator with notepad

C:\Windows\System32\drivers\etc

add this line

127.0.0.1       aquarama

http://aquarama/



Admin details
username: jrmoffett1@gmail.com
password: jonrossmoffett

user details
username: test@gmail.com
password: password
