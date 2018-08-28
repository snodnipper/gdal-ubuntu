#!/bin/bash
docker run -v $(pwd):/data gd:latest ogr2ogr -f MBTILES malta.mbtiles malta-latest.osm.pbf -dsco MAXZOOM=14 -dsco MINZOOM=14 
