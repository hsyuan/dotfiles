#!/bin/bash

#sudo apt-get update
sudo apt-get install -y vim-nox tmux git tree cscope

# Development dependencies
sudo apt-get install -y build-essential
sudo apt-get install -y cmake

# Download libraries
git clone https://github.com/greenplum-db/gpdb
git clone https://github.com/greenplum-db/gp-orca
git clone https://github.com/greenplum-db/gpos
git clone https://github.com/greenplum-db/gp-xerces


# GPDB dependencies
sudo apt-get install -y bison flex
sudo apt-get install -y libreadline-dev
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y libyaml-dev
sudo apt-get install -y libapr1-dev
sudo apt-get install -y libevent-dev
sudo apt-get install -y libcurl-dev
sudo apt-get install -y libpam-dev
sudo apt-get install -y libcurl4-dev
sudo apt-get install -y libbz2-dev
sudo apt-get install -y python-dev
sudo apt-get install -y ssh

sudo apt-get install -y libcurl4-openssl-dev

sudo apt-get install -y python-pip


# Other GPDB dependencies --with-perl --with-python --with-libxml
sudo apt-get install -y libxml2-dev libperl-dev


# Python dependencies
sudo pip install lockfile 
sudo pip install paramiko
sudo pip install setuptools
sudo pip install epydoc
sudo pip install --pre psi
