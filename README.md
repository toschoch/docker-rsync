Docker Rsync
============
author: Tobias Schoch

Overview
--------
Rsync connection containers from/to for blob storage upload to server and possibility of notifying
a solr server. A compose file with a test setup and customized containers.

Change-Log
----------
##### 0.0.1
* initial version


Installation / Usage
--------------------
clone the repo:

```
git clone https://github.com/toschoch/docker-rsync.git
```
build the docker rsync-from, rsync-to images
```
cd rsync-from
docker build . -t shocki/rsync-from
cd ..

cd rsync-to
docker build . -t shocki/rsync-to
cd ..
```

Example
-------

run the test compose
```
docker compose up -d
```