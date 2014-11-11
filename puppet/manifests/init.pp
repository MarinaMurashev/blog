Exec { path => "/home/vagrant/bin:/usr/local/rbenv/bin:/usr/local/rbenv/shims::/usr/local/rbenv/shims/bin:/usr/bin:/bin:/usr/sbin:/sbin" }

exec { 'apt-update':
  command => "/usr/bin/apt-get update",
  onlyif => "/bin/bash -c 'exit $(( $(( $(date +%s) - $(stat -c %Y /var/lib/apt/lists/$( ls /var/lib/apt/lists/ -tr1|tail -1 )) )) <= 604800 ))'"
}

Exec["apt-update"] -> Package <| |>

package { "libpq-dev": ensure => present }
package { "nodejs": ensure => present }

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

exec {"bundle install":
  command   => "bundle --binstubs=/home/vagrant/bin --path=/home/vagrant/.bundle",
  cwd       => "/vagrant",
  user      => "vagrant",
  timeout   => 0,
  require   => [Rbenv::Build["2.1.1"], File["/home/vagrant/bin"], File["/home/vagrant/.bundle"]]
}

Package <| |> -> Exec["bundle install"]
