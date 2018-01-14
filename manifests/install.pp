# == Class: docker
#
# Module to install an up-to-date version of Docker from a package repository.
# This module currently works only on Debian, Red Hat
# and Archlinux based distributions.
#
class docker::install {
  if $docker::docker_ce {
    yumrepo { 'Docker CE Stable - $basearch':
      name                         => 'docker-ce-stable',
      ensure                       => present,
      baseurl                      => 'https://download.docker.com/linux/centos/7/$basearch/stable',
      enabled                      => true,
      gpgcheck                     => true,
      gpgkey                       => 'https://download.docker.com/linux/centos/gpg',
    }
    -> package { 'docker-ce': ensure => $docker::ensure, }
  } else {
    package { 'docker': ensure => $docker::ensure, }
  }
}
