#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "e.g. gb-buildings.gpkg"
fi

docker run -v $(pwd):/data gd:latest ogrinfo $1 -sql "SELECT CreateSpatialIndex('multipolygons', 'geom')"
