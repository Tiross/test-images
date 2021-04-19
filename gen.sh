#! /bin/bash

versions=(5.20 5.22 5.24 5.26 5.28 5.30 5.32)
name="tiross/test-images"

for version in "${versions[@]}"; do
  tag="perl-${version}"

#  (echo VERSION=$version; echo "cat << EOF"; cat Dockerfile.template; echo "EOF" ) | bash > "$version/Dockerfile"
  (echo VERSION=$version; echo "cat << EOF"; cat Dockerfile.template; echo "EOF" ) | bash | docker build -t ${name}:${tag} -
  docker push ${name}:${tag}
done
