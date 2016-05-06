#!/bin/bash
sudo yum install -y epel-release

# install development tools
sudo yum -y groupinstall "Development tools"
sudo yum install -y screen htop vim tmux git emacs wget cmake3 ccache
sudo yum install -y unzip postgresql
sudo yum install -y zlib-devel curl-devel bzip2-devel python-devel readline-devel pam-devel

# install python packages needed for gpdemo/ management utils
sudo yum install -y python-pip
sudo pip install --upgrade pip
sudo pip install psi lockfile paramiko setuptools epydoc psutil

# install packages needed for gpfdist
sudo yum install -y libyaml-devel libyaml-devel apr-devel libevent-devel libxml2-devel
   
# install packages for installcheck-good
sudo yum install -y "perl-Env" "perl-ExtUtils-*"

# Fixups
sudo ln -s /usr/bin/cmake3 /usr/bin/cmake
sudo chmod a+rw /usr/local
