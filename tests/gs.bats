#!/usr/bin/env bats

#  load 'libs/bats-core/load' # dont do this. instead: brew install bats-core
 load 'libs/bats-assert/load'
  load 'libs/bats-file/load'

@test "gs testdir/gitdir" {
  result="$(gs testdir/gitdir | bc)"
  [ "$result" -eq 4 ]
}