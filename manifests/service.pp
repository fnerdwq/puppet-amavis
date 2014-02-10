# managing the service (private)
class amavis::service {

  service {'amavis':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
