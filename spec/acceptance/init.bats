# BATS test file to run after executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

# Tests are really easy! just the exit status of running a command...
@test "ypbind removed" {
  ! rpm -q ypbind
}

@test "ypserve removed" {
  ! rpm -q ypserv
}

@test "ypbind service stopped/gone" {
  ! systemctl status ypbind
}

@test "ypserv service stopped/gone" {
  ! systemctl status ypserv
}
