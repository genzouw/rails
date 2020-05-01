#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o noclobber

git checkout each-versions

VERSION="${VERSION:-6.0.1}"

git checkout -b v${VERSION} \
  && sed -i "s/\${DOCKER_TAG}/${VERSION}/g" Dockerfile \
  && git add -A \
  && git commit -m "${VERSION}" \
  && git push origin v${VERSION}

git tag ${VERSION} \
  && git push origin ${VERSION}
