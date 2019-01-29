# server_scripts
our server codes in order to train, and test our model

## Steps to get into Server from ubuntu.

1- first I generated the ssh key using
   Open Terminal, and Type.
  `ssh-keygen -C "my registered email address" `

2- then copied the public key from

`gedit /home/"login user"/.ssh/id_rsa.pub`

 It will open the text editor then contains the public key.
 Copy it.
 
3- then login into this [page](https://hpc.bibalex.org/#dashboard) to the dashborad.

![dashboard login page](https://github.com/The-FaZe/server_scripts/blob/master/server_steps_photos/dashboard_login.png)

4- Open Your mailbox and click on the link in order to login into the dashborad.

5-The dashborad will open.

![dashborad](https://github.com/The-FaZe/server_scripts/blob/master/server_steps_photos/dashborad.png)

6- click on Action Recgnition.

7- Scroll down untill you reach your name.

8- In front of your name click add key

![add key](https://github.com/The-FaZe/server_scripts/blob/master/server_steps_photos/adding_ssh_publickey.png)

9- Paste your public ssh key, then click submit.

![paste pubulic ssh key](https://github.com/The-FaZe/server_scripts/blob/master/server_steps_photos/paste_public_ssh.png)


10- Then you will receive your username in your email address.

then used ssh to get acess to the server

$ssh -i /home/"login user"/.ssh/id_rsa username@hpc.bibalex.org

$ssh-add ~/.ssh/id_rsa
$chmod 600 ~/.ssh/id_rsa


<<<<<<in order to log in>>>>>>>>>>>
$ssh username@hpc.bibalex.org

