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
# [*final_spam_destiny*]
#   *Optional* (Debian default: D_BOUNCE)
#
# [*sa_tag_level_deflt*]
#   *Optional* (Debian default: 2.0)
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
  $myhostname         = $::fqdn,
  $mydomain           = $::domain,
  $viruschecks        = false,
  $spamchecks         = false,
  $final_spam_destiny = undef,
  $sa_tag_level_deflt = undef,
) {

  validate_string($myhostname)
  validate_string($mydomain)
  validate_bool($viruschecks)
  validate_bool($spamchecks)

  if $final_spam_destiny {
    validate_re($final_spam_destiny,
      ['^D_DISCARD$','^D_BOUNCE$','^D_REJECT$','^D_PASS$'] )
  }
  if $sa_tag_level_deflt {
    validate_re($sa_tag_level_deflt, '^-?\d+(\.\d{0,2})?$')
  }

  contain amavis::install
  contain amavis::config
  contain amavis::service

  Class['amavis::install']
  -> Class['amavis::config']
  ~> Class['amavis::service']


}
