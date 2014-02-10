# managing the service (private)
class amavis::service {

  services {'amavis':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
