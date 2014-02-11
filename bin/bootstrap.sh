#!/bin/bash
wget  https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-11.10.0-1.el6.x86_64.rpm
rpm -i chef-*.rpm
chef-solo -c ./solo.rb -j dna.json
