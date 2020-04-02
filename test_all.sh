#!/usr/bin/env bash

function run_test() {
    local dockerfile=$1
    local filename=$(basename -- "$dockerfile")
    local test_name="${filename%.*}"
    echo "Running $test_name"
    local image_name="crystal_shared_lib_${test_name}"
    echo "Building test image: ${image_name}"
    docker build --quiet -f $dockerfile -t $image_name .
    echo "To manually inspect the image: docker run -ti --rm ${image_name} bash"
    echo "Running 'ruby main.rb' in ${image_name}"
    docker run -ti --rm $image_name ruby main.rb
}

dockerfiles=$(ls *.Dockerfile)

for dockerfile in $dockerfiles; do
    run_test $dockerfile
    echo ""
done