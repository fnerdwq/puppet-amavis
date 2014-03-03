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
# [*user_config*]
#   Arbitrary user orveride as to be put in amavisd.conf
#   *Optional* (defaults to undef)
#
# [*whitelist*]
#   Whitelist of email addresses (one per line)
#   *Optional* (defaults to '')
#
# [*blacklist*]
#   Blacklist of Email addresses (one per line)
#   *Optional* (defaults to '')
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
  $user_config = undef,
  $whitelist   = '',
  $blacklist   = '',
) {

  validate_string($myhostname)
  validate_string($mydomain)
  validate_bool($viruschecks)
  validate_bool($spamchecks)
  validate_string($user_config)
  validate_string($whitelist)
  validate_string($blacklist)

  contain amavis::install
  contain amavis::config
  contain amavis::service

  Class['amavis::install']
  -> Class['amavis::config']
  ~> Class['amavis::service']


}
