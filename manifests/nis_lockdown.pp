# Nis_removal::Nis_lockdown
#
# If NIS must be used in the environment, limit access to the NIS data to
# specific subnets.
#
# @param allowed_subnet space delimited bitmask + subnet to allow access from
class nis_removal::nis_lockdown($allowed_subnet = "255.255.255.0 192.168.1.0") {
  if $osfamily != "AIX" {
    fail("${name} only supports AIX")
  }

  # Create and secure the /var/yp/securenets file (if it does not already exist):
  file { "/var/yp/securenets":
    ensure => "file",
    owner  => "root",
    group  => "system",
    mode   => "0600",
  }

  file_line { "yp allowed subnet":
    ensure => present,
    line   => $allowed_subnet,
    notify => Service["yp"]
  }

  # don't explicitly start or stop the service, just make it exist in the node
  # graph so that it may be restarted
  service { "yp": }

}
