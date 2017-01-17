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
      $service = 'yp'
      $package = ["bos.net.nis.server", "bos.net.nis.client"]
    }
    "RedHat": {
      $service = ['ypbind', 'ypserv']
      $package = ['ypbind', 'ypserv']
    }
    default {
      fail("${module_name} does not support ${osfamily}")
    }
  }

}
