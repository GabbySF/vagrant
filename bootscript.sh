#!/bin/bash
if [ -f /etc/profile.d/systemvariable.sh ];
then
   echo "System Variables in place"
else
   echo "System Variables SET UP"
   ln -s /vagrant/systemvariable.sh /etc/profile.d/systemvariable.sh
fi
