# == Class: etcd
#
class etcd::install {
  if $::etcd::manage_package {
    $ensure = $::etcd::ensure ? { 'held' => present, default => $::etcd::ensure }
    $mark = $::etcd::ensure ? { 'held' => hold, default => none }
    package { $::etcd::package_name: ensure => $ensure, mark => $mark }
  }
}
