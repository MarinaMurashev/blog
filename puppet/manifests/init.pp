# $username = "vagrant"
# $home = "/home/${username}"

# Exec {
#   path => "${home}/bin:/usr/local/rbenv/bin:/usr/local/rbenv/shims::/usr/local/rbenv/shims/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# }

# class { 'rbenv': }

# rbenv::plugin { 'ianheggie/rbenv-binstubs': }
# rbenv::plugin { 'sstephenson/rbenv-gem-rehash':
#   before => Rbenv::Gem["bundler-2.1.1"]
# }

# rbenv::build { '2.1.1': global => true }

# file { "${home}/bin":
#   ensure => directory,
#   owner => $username
# }

# file { "${home}/.bundle":
#   ensure => directory,
#   owner => $username
# }

# exec {"bundle install":
#   command   => "bundle --binstubs=${home}/bin --path=${home}/.bundle",
#   cwd       => "/vagrant",
#   user      => $username,
#   unless    => "test 1 -eq `/usr/local/rbenv/shims/bundle check | grep 'satisfied$' | wc -l`",
#   timeout   => 0,
#   require   => [Rbenv::Build["2.1.1"], File["${home}/bin"], File["${home}/.bundle"]]
# }
