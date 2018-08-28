FROM ubuntu:18.04

# Base dependencies
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y tzdata \
 && apt-get install -y apt-utils dialog \
 && apt-get update \
 && apt-get install -y software-properties-common \
 && apt-get update \
 && apt-get install -y --allow-unauthenticated python-numpy libpng-dev libjpeg-dev libgif-dev liblzma-dev libgeos-dev libcurl4-gnutls-dev libproj-dev libxml2-dev libexpat-dev libxerces-c-dev libnetcdf-dev netcdf-bin libpoppler-dev libpoppler-private-dev libspatialite-dev gpsbabel swig libhdf4-alt-dev libhdf5-serial-dev poppler-utils libfreexl-dev unixodbc-dev libwebp-dev libepsilon-dev liblcms2-2 libpcre3-dev libcrypto++-dev libdap-dev libfyba-dev libkml-dev libmysqlclient-dev libogdi3.2-dev libcfitsio-dev openjdk-8-jdk libzstd1-dev ccache bash zip curl \
 && apt-get install -y make \
 && apt-get install -y python-dev \
 && apt-get install -y g++ \
 && apt-get install -y --allow-unauthenticated fossil libgeotiff-dev libcharls-dev libopenjp2-7-dev libcairo2-dev \
 && apt-get install -y git

# Latest - could replace with an official release
RUN cd /tmp && git clone https://github.com/OSGeo/gdal.git \
 && cd /tmp/gdal/gdal \
 && ./configure \
 && make install \
 && /sbin/ldconfig

# Externally accessible data is by default put in /data
WORKDIR /data
VOLUME ["/data"]

# Output version and capabilities by default.
CMD gdalinfo --version && gdalinfo --formats && ogrinfo --formats
