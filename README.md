== README

This is the code for building my blog: https://marinamurashev.com/

To get it up and running on your own:
1. install Vagrant: http://www.vagrantup.com/
2. install VirtualBox: https://www.virtualbox.org/
3. clone this repository and `cd` into the repository's directory
4. install the vagrant librarian puppet plugin:
  `vagrant plugin install vagrant-librarian-puppet`
5. make the modules path:
  `mkdir modules`
6. install the box:
  `vagrant up`
7. Once the box is finished installing, run:
  `vagrant ssh`
8. This will take you inside the box. From there, you'll want to go to the app's directory:
  `cd /vagrant`
9. Run the migrations: `rake db:migrate`
10. Start the rails server `rails s` and go to localhost:3000 on your local machine.
