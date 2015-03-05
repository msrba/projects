#
class gwdg::projects::redmine(
){
  
  include gwdg::projects::base

  #TODO SVN Dav configurieren
  #TODO Gitolite einrichten
  #TODO Plugins installieren
  #TODO Server Zertificat einrichten 
  #TODO Theme anpassen: https://github.com/RCRM/circle.git
  
  case $::operatingsystem {
    debian,ubuntu: {
      package {'subversion-tools': 
        ensure => present;
      }
    }
    default: { 
      package{'subversion':
        ensure => present,
      } 
    }
  }
  
  class { '::apache': 
   default_vhost => false,
  }
  ::apache::listen {'80': } # Fix Error: Could not apply complete catalog: Found 1 dependency cycle: ... 

  class { '::apache::mod::passenger': }  
  class { '::mysql::server': } 
  class { '::redmine': 
    version => '3.0.0',
  }
}