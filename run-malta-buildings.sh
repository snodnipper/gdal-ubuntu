#!/bin/bash
docker run -v $(pwd):/data gd:latest ogr2ogr -f MBTILES malta.mbtiles -sql "SELECT * FROM multipolygons WHERE building IS NOT NULL"  malta-latest.osm.pbf -dsco MAXZOOM=14 -dsco MINZOOM=10
