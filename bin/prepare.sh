#!/usr/bin/env bash -x

is-macos(){
  if [ $(uname -s) = "Darwin" ]; then
    return 0
  else
    return 1
  fi
}

is-excutable(){
  if type "$1" >/dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

is-supported(){
  if [ $# -eq 1 ]; then
    if eval "$1" > /dev/null 2>&1; then 
    return 0
  else
    return 1
  fi
  else
    if eval "$1" > /dev/null 2>&1; then
        echo -n "$2"
    else
        echo -n "$3"
    fi
  fi
}