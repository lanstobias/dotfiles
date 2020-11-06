#!/bin/bash

fancy_echo() {
   local fmt="$1"; shift

   # shellcheck disable=SC2059
   printf "${fmt}\n" "$@"
}

fancy_echo_line() {
   local fmt="$1"; shift

   # shellcheck disable=SC2059
   printf "\n$fmt" "$@"
}
