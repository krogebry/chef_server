##
# Bootstrap a chef server
# 
# @author Bryan Kroger ( bryan_kroger@intuit.com )

remote_file "/tmp/chef-server.rpm" do
  source "https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-server-11.0.10-1.el6.x86_64.rpm"
end

package "chef-server" do
  source "/tmp/chef-server.rpm"
end

execute "run runsvdir" do
  command "/opt/chef-server/embedded/bin/runsvdir -P -P /opt/chef-server/service" 
end

## configure the server
execute "chef-server-ctl reconfigure" do
  command "chef-server-ctl reconfigure" 
end
