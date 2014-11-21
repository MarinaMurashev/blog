**Blog README**

This is the code for building my blog: http://marinamurashev.com/

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
11. Create a user directly through your database (this isn't done through a UI because only the person that creates the blogs will need to log in):
  1. `rails c`
  2. `User.create(email: 'myemail@email.com', password: 'password123')`
  3. `exit`
12. In your browser, go to http://localhost:3000/users/sign_in and sign in using the same credentials you just set up.
13. Either click on 'Create New Post' or go to http://localhost:3000/posts/new to create a new post. The post should be in Markdown format.
