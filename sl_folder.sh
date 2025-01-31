#!/bin/bash

#Function to move folder and replace with symlink
sl_folder()     {
  echo "moving folder ${1}/${2} to ${3}/${4}"
  mkdir -p "${3}/${4}"
  if [ -d "${1}/${2}" ]; then
    rsync -r "${1}/${2}/" "${3}/${4}/" --verbose
  fi
  echo "removing folder ${1}/${2} and create symlink"
  if [ -d "${1}/${2}" ]; then
    rm -rf "${1}/${2}"
  fi
  if [ ! -L "${1}/${2}" ]; then
    ln -s "${3}/${4}/" "${1}"
    if [ ! -L "${1}/${2}" ]; then
      mv "${1}/${4}" "${1}/${2}"
    fi
  fi
}