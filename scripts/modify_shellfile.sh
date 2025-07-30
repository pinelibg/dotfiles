#!/usr/bin/env bash

set -euo pipefail

if ! command -v print_template &> /dev/null; then
  echo "Error: print_template command not found. Please ensure that the template function is defined." >&2
  exit 1
fi

# Create temporary file to store input
tempfile="$(mktemp)"
trap 'rm -f "${tempfile}"' EXIT
cat > "${tempfile}"

# Define block markers
START_BLOCK="# MANAGED BLOCK BY DOTFILE"
END_BLOCK="# END OF MANAGED BLOCK BY DOTFILE"

# If the original file does not contain the managed block, insert it at the beginning
if ! (grep -q "${START_BLOCK}" "${tempfile}" && grep -q "${END_BLOCK}" "${tempfile}"); then
  # Output managed block
  echo "${START_BLOCK}"
  print_template
  echo "${END_BLOCK}"

  # Output the entire content of the file
  cat "${tempfile}"
else
  # Output content before managed block
  sed "/${START_BLOCK}/q" "${tempfile}" | sed '$d'

  # Output managed block
  echo "${START_BLOCK}"
  print_template
  echo "${END_BLOCK}"

  # Output content after managed block
  sed -n "/${END_BLOCK}/,\$p" "${tempfile}" | sed "1d"
fi
