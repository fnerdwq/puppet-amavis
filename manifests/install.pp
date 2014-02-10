# installing necessary packages (private)
class amavis::install {
  package { 'amavisd-new': ensure => lastest }
}
