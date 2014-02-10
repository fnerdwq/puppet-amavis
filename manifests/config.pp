# configuring amavis (private)
class amavis::config {

  $viruschecks = str2bool($amavis::viruschecks)
  $spamchecks  = str2bool($amavis::spamchecks)

  File {
    owner => root,
    group => root,
    mode  => '0644',
  }

  file {'/etc/amavis/conf.d/01-debian':
    ensure  => present,
    content => template('amavis/01-debian.erb'),
  }

  file {'/etc/amavis/conf.d/05-domain_id':
    ensure  => present,
    content => template('amavis/05-domain_id.erb'),
  }

  file {'/etc/amavis/conf.d/05-node_id':
    ensure  => present,
    content => template('amavis/05-node_id.erb'),
  }

  file {'/etc/amavis/conf.d/15-av_scanners':
    ensure  => present,
    content => template('amavis/15-av_scanners.erb'),
  }

  file {'/etc/amavis/conf.d/15-content_filter_mode':
    ensure  => present,
    content => template('amavis/15-content_filter_mode.erb'),
  }

  file {'/etc/amavis/conf.d/20-debian_defaults':
    ensure  => present,
    content => template('amavis/20-debian_defaults.erb'),
  }

  file {'/etc/amavis/conf.d/25-amavis_helpers':
    ensure  => present,
    content => template('amavis/25-amavis_helpers.erb'),
  }

  file {'/etc/amavis/conf.d/30-template_localization':
    ensure  => present,
    content => template('amavis/30-template_localization.erb'),
  }

  file {'/etc/amavis/conf.d/50-user':
    ensure  => present,
    content => template('amavis/50-user.erb'),
  }

}

