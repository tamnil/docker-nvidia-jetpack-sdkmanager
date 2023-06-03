#!/bin/sh
set -e

sdkmanager \
--cli install \
--datacollection disable \
--logintype devzone \
--staylogin true \
--product Jetson \
--version 5.1.1 \
--targetos Linux \
--host \
--target JETSON_XAVIER_NX_TARGETS \
--flash all \
--additionalsdk 'DeepStream 6.2' \
--license accept

exec "$@"

