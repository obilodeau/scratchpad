#!/bin/bash
#
# a Dockerfile would look like:
# FROM perl:5.16
# COPY . /usr/src/myapp
# WORKDIR /usr/src/myapp
# CMD [ "perl", "./test.pl" ]
#
#docker run -it --rm --name perl-deprecation-test -v "$PWD":/usr/src/myapp -w /usr/src/myapp perl:5.16 perl $@
docker run -it --rm --name perl-deprecation-test -v "$PWD":/usr/src/myapp -w /usr/src/myapp perl:5.10 perl $@
