# BATS test file to run before executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

# Tests are really easy! just the exit status of running a command...
@test "yp packages installed" {
  rpm -q ypbind
  rpm -q ypserv
}
