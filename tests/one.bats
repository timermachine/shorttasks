#!/usr/bin/env bats

#  load 'libs/bats-core/load' # dont do this. instead: brew install bats-core
 load 'libs/bats-assert/load'
  load 'libs/bats-file/load'


@test "addition using bc" {
  result="$(echo 2+2 | bc)"
  [ "$result" -eq 4 ]
}

@test "addition using dc" {
  result="$(echo 2 2+p | dc)"
  [ "$result" -eq 4 ]
}

# todo: setup not quite there:
# @test 'assert_exists()' {
#     echo "$PWD"
#   assert_exists ./one.bats
# }