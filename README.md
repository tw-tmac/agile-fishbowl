agile-fishbowl
==============
Dev machine setup:
1) Install vagrant (https://www.vagrantup.com/downloads.html or "brew install vagrant")
2) Install virtual box (https://www.virtualbox.org/wiki/Downloads or "brew cask install virtualbox")
3) run "vagrant up"
4) run "vagrant ssh"
5) cd /vagrant/
6) run "bundle install"
7) run "rake db:migrate"
8) run "rake db:seed"
9) To start the app run "rake shotgun"
