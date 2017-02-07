# Nis_removal::Params
#
# Params pattern class
class nis_removal::params {
  case $osfamily {
    "Solaris": {
      $service = [
        "svc:/network/nis/server",
        "svc:/network/nis/passwd",
        "svc:/network/nis/update",
        "svc:/network/nis/xfr",
        "svc:/network/nis/client",
        "svc:/network/rpc/nisplus",
      ]

      # leave packages in-place
      $package = false
    }
    "AIX": {
      $service        = 'yp'
      $package        = ["bos.net.nis.server", "bos.net.nis.client"]
      $package_ensure = absent
    }
    "RedHat": {
      $service        = ['ypbind', 'ypserv']
      $package        = ['ypbind', 'ypserv']
      $package_ensure = purged
    }
    default: {
      fail("${module_name} does not support ${osfamily}")
    }
  }

}
