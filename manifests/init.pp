# == Class: amavis
#
# This installs amavisd-new an configures basic stuff.
#
# This works on Debian.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*enable_viruschecks*]
#   Enables virus checking in amavis.
#   *Optional* (defaults to false)
#
# [*enable_spamchecks*]
#   Enables spam checking in amavis.
#   *Optional* (defaults to false).
#
# === Examples
#
# include amavis
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class amavis (
  $enable_viruschecks = false,
  $enable_spamchecks = false,
) {

  validate_bool(str2bool($enable_viruschecks))
  validate_bool(str2bool($enable_spamchecks))


  contain amavis::install
  contain amavis::config
  contain amavis::service

  Class['amavis::install']
  -> Class['amavis::config']
  ~> Class['amavis::service']


}
