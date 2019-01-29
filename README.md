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
 
3- then log in into this [page](https://hpc.bibalex.org/#dashboard) to the dashborad


then I received my username in my email
then used ssh to get acess to the server

$ssh -i /home/"login user"/.ssh/id_rsa username@hpc.bibalex.org

$ssh-add ~/.ssh/id_rsa
$chmod 600 ~/.ssh/id_rsa


<<<<<<in order to log in>>>>>>>>>>>
$ssh username@hpc.bibalex.org

