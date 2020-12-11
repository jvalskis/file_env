#!/usr/bin/env sh

set -e

# Indirect expansion (ie) is not supported in bourne shell.
ie_gv() {
	eval "echo \$$1"
}

# Exports the provided VARIABLE with the contents of the file that a corresponfing VARIABLE_FILE points to
# Usage:
#  file_env VARIABLE [default_value]
file_env() {
	local var="$1"
	local fileVar="${var}_FILE"
	local default="${2:-}"

	if [ "$(ie_gv ${var})" != "" ] && [ "$(ie_gv ${fileVar})" != "" ]; then
		echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
		exit 1
	fi

	local value="$default"
	if [ "$(ie_gv ${var})" != "" ]; then
		value=$(ie_gv ${var})
	elif [ "$(ie_gv ${fileVar})" != "" ]; then
		value=`cat $(ie_gv ${fileVar})`
	fi
	export "$var"="$value"
	unset "$fileVar"
}