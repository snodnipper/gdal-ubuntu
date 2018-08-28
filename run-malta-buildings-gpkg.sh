#!/bin/bash
docker run -v $(pwd):/data gd:latest ogr2ogr -f GPKG malta.gpkg -lco GEOMETRY_NAME=geom -lco spatial_index=off -gt 100000 -sql "SELECT * FROM multipolygons WHERE building IS NOT NULL"  malta-latest.osm.pbf 
echo Now try ogrinfo malta.gpkg -sql "SELECT CreateSpatialIndex('multipolygons', 'geom')"