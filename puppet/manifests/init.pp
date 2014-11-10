# --- Postgres -----------------------------------------------------------------
class { 'postgresql::server': }

# --- Ruby ---------------------------------------------------------------------

class { 'rbenv': }

rbenv::plugin { 'sstephenson/ruby-build': }
rbenv::plugin { 'ianheggie/rbenv-binstubs':}
rbenv::plugin { 'sstephenson/rbenv-gem-rehash':
  before => Rbenv::Gem["bundler-2.1.1"]
}

rbenv::build { '2.1.1': global => true }

file { "/home/vagrant/bin":
  ensure => directory,
  owner => "vagrant"
}

file { "/home/vagrant/.bundle":
  ensure => directory,
  owner => "vagrant"
}
