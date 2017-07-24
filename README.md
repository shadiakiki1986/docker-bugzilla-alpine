# docker-bugzilla-alpine
*WIP*

Docker image with bugzilla, based on alpine image, excluding the mysql database and apache

The original [dklawren/docker-bugzilla](https://github.com/dklawren/docker-bugzilla) image
is around [1 GB](https://hub.docker.com/r/dklawren/docker-bugzilla/tags/)
because it includes apache and mysql

This docker image is an effort to create a small-footprint docker image for bugzilla that can connect to an existing mysql database

Also, dklawren's image seems to be stale, with plenty of open issues and PR's on github. None of the other PR's tackle the issue of separating the database out of the docker image.

To see the image's size: `docker ps -s|grep bugzilla`

Error: `sys/types.h: No such file or directory`

Alternative: [vimagick/mantisbt](https://hub.docker.com/r/vimagick/mantisbt/)
- already existant docker image that can link to mysql
- 184 MB
- last pushed 2017-07
- docker pull vimagick/mantisbt
