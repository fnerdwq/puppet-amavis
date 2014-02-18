#puppet-amavis

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What amavis affects](#what-amavis-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with amavis](#beginning-with-amavis)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [TODOs](#todos)

##Overview

This small amavis module installs and configures amavisd-new.

Written for Puppet >= 3.4.0.

##Module Description

See [Overview](#overview) for now.

##Setup

###What amavis affects

* Installs amavisd-new.
* Manages the service.

###Setup Requirements

Clamav and spamassassin might are usefull, see parameters **virusches**/**spamchecks**.
	
###Beginning with amavis	

Simply include it.

##Usage

Just include the module by 

```puppet
include amavis
```

##Limitations:

Tested only on 
* Debian 7
so far.

Puppet Version >= 3.4.0, due to specific hiera/*contain* usage.

##TODOs:

* Make it work on RedHat like systems.
* Make mor configurable.
* ... suggestions? Open an issue on github...
