# == Class: powershell_net4
#
# This module ensures that a config file is created
# next to PowerShell to ensure that it will use the
# latest .NET framework available.
#
# === Authors
#
# Rob Reynolds <ferventcoder at gmail>
#
# === Copyright
#
# Copyright 2015 Rob Reynolds, unless otherwise noted.
#
class powershell_net4 {
  # based on the following:
  # - http://www.powershellmagazine.com/2012/06/11/adam-driscolls-favorite-powershell-tips-tricks/
  # - http://stackoverflow.com/questions/2094694/how-can-i-run-powershell-with-the-net-4-runtime
  # - http://tfl09.blogspot.com/2010/08/using-newer-versions-of-net-with.html
  # - http://viziblr.com/news/2012/5/16/the-easy-way-to-run-powershell-20-using-net-framework-40.html
  # - http://www.adminarsenal.com/admin-arsenal-blog/powershell-running-net-4-with-powershell-v2

  $powershell_folder = get_powershell_folder_location()
  $powershell_config = "$powershell_folder\\powershell.exe.config"

  file { "$powershell_config":
    ensure => file,
    source => "puppet:///modules/powershell_net4/powershell.exe.config",
    source_permissions => ignore,
  }

  # Additionally, you may want to restrict permissions on the config
  # file. They should be restricted based on inheritance from the folder,
  # but not all versions of puppet do that.
  # You can do that with acl module very simply.
  # acl { "$poweshell_config":
  #   permissions => [
  #    { identity => 'Administrator', rights => ['full'] },
  #    { identity => 'Users', rights => ['read','execute'] }
  #   ],
  # }

  # you may also want to consider adding a configuration
  # at c:/windows/sysWOW64/WindowsPowershell/v1.0 for 64 bit systems
}
