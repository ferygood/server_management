# change mode/group/own; rwx, r=4, w=2, x=1
chmod 744 file_name
chgrp grp_name file_name
chown user_name file_name

#option -R is for all file
chmod -R 744 file_name

# chmod [ugoa], u=file owner, g=group accounts, o=others, a=u+g+o
chmod a-x file_name # delete executable function for all user
