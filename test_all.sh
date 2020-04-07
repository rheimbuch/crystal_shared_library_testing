#!/usr/bin/env bash

function run_test() {
    local crystal_version=$1
    echo "Running test with Crystal ${crystal_version}"
    local image_name="crystal_shared_lib_v${crystal_version}"
    echo "Building test image: ${image_name}"
    docker build --build-arg crystal_version="${crystal_version}" -t "${image_name}" .
    echo "To manually inspect the image: docker run -ti --rm ${image_name} bash"
    echo "Running 'ruby main.rb' in ${image_name}"
    docker run -ti --rm "${image_name}" ruby main.rb
}

crystal_versions=("0.28.0" "0.29.0" "0.30.0" "0.31.1" "0.32.1" "0.33.0" "0.34.0")

for crystal_version in "${crystal_versions[@]}"; do
    run_test "$crystal_version"
    echo ""
done