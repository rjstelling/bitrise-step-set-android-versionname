#!/bin/bash

set -ex

# Test for xmlstarlet
hash xmlstarlet 2>/dev/null || { echo >&2 "xmlstarlet required, but it's not installed."; exit 1; }

OLD_VERSIONNAME=$(xmlstarlet sel -t -v "${xml_versionname_path}" "${android_manifest_path}")
xmlstarlet ed --inplace -u "${xml_versionname_path}" -v "${version_name}"  "${android_manifest_path}"
NEW_VERSIONNAME=$(xmlstarlet sel -t -v "${xml_versionname_path}" "${android_manifest_path}")

echo
echo "Updated '${xml_versionname_path}':"
echo "\tOld: $OLD_VERSIONNAME"
echo "\tNew: $NEW_VERSIONNAME"
echo
