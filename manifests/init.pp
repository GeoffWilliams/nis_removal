# Nis_removal
#
# Class to disable NIS service and optionally remove NIS packages where applied
#
# @param package - List of packages to remove or false if nothing should be removed
# @param service - List of services to disable and stop
class nis_removal(
    $package        = $nis_removal::params::package,
    $package_ensure = $nis_removal::params::package_ensure,
    $service        = $nis_removal::params::service,
) inherits nis_removal::params{

  service { $service:
    ensure => stopped,
    enable => false,
  }

  # package removal platform-optional (solaris we do not uninstall).  We must
  # use 'purged' to avoid having to remove each package in the correct order
  if $package {
    package { $package:
      ensure => $package_ensure,
    }
  }
}
