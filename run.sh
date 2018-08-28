#!/bin/bash
docker run -v $(pwd):/data gd:latest ogr2ogr -f MBTILES test.mbtiles test.geojson -dsco MAXZOOM=4 -dsco MINZOOM=4 
