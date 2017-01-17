# Nis_removal::Nis_lockdown

# If NIS must be used in the environment, limit access to the NIS data to
# specific subnets.

class nis_removal::nis_lockdown {
  if $osfamily != "AIX" {
    fail("${class_name} only supports AIX")
  }

  # Create and secure the /var/yp/securenets file (if it does not already exist):
  file { "/var/yp/securenets":
    ensure  => "file",
    owner   => "root",
    group   => "system",
    mode    => "0600",
  }

  file_line { "yp allowed subnet"
    ensure  => present,
    line    => "255.255.255.0 128.311.10.0"
    notify  => Service["yp"]
  }

  # don't explicitly start or stop the service, just make it exist in the node
  # graph so that it may be restarted
  service { "yp": }

}
