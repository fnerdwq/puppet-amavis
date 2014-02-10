# == Class: amavis
#
# This installs amavisd-new an configures basic stuff.
#
# This works on Debian.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*myhostname*]
#   Hostname to use.
#   *Optional* (defaults to $::fqdn)
#
# [*mydomain*]
#   Domain to use.
#   *Optional* (defautls to $::domain)
#
# [*viruschecks*]
#   Enables virus checking in amavis.
#   *Optional* (defaults to false)
#
# [*spamchecks*]
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
  $myhostname  = $::fqdn,
  $mydomain    = $::domain,
  $viruschecks = false,
  $spamchecks  = false,
) {

  validate_string($myhostname)
  validate_string($mydomain)
  validate_bool(str2bool($viruschecks))
  validate_bool(str2bool($spamchecks))


  contain amavis::install
  contain amavis::config
  contain amavis::service

  Class['amavis::install']
  -> Class['amavis::config']
  ~> Class['amavis::service']


}
