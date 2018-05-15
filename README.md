Docker Rsync
============
author: Tobias Schoch

Overview
--------

Rsync connection containers (from, to) for blob storage upload to server.
A compose file with a test setup and customized containers

Change-Log
----------
##### 0.0.1
* initial version


Installation / Usage
--------------------
clone the repo:

```
git clone <git-url>
```
build the docker rsync-from image
```
cd rsync-from
docker build . -t rsync-from
cd ..
```

Example
-------

run the test compose
```
docker compose up -d
```