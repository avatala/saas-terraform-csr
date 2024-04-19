#! /bin/bash

tag="VERSION"
tag=$(echo $tag | sed 's/^v//')

IFS="." read version minor patch <<< "$tag";

case "$1" in
patch) tag="v$version.$minor.$((patch+1))"; ;;
major) tag="v$((version+1)).0.0"; ;;
minor) tag="v$version.$((minor+1)).0"; ;;
*)     tag="v$version.$minor.$patch"; ;;
esac
              
echo "the new version is $tag"