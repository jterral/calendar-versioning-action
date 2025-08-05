#!/bin/bash
set -e

echo "::group::🔖 Versioning"

calver=$(date +'%y.%U')
minor=$(git tag -l "$calver.*" | sort -V | wc -l)
tag="${INPUT_TAG_PREFIX}${calver}.${minor}"
version="${tag}+${GITHUB_RUN_NUMBER}"

echo "tag=$tag" >> $GITHUB_OUTPUT
echo "version=$version" >> $GITHUB_OUTPUT

echo "Generated tag: $tag"
echo "Generated version: $version"

echo "::endgroup::"
