#
class gwdg::projects::redmine(
){
  
  include gwdg::projects::base

  class { 'apache': }
  class { 'apache::mod::passenger': }
  class { '::mysql::server': }
  class { '::redmine': }
}