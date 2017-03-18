#!/bin/bash
set -e

# Only the compiled output is going to get deployed, Google cloud functions will
# never see any of the "source" or other supporting files.

cd cloudfn

# Any real application probably has a more elaborate deployment process. Here I
# simply hardcoded my example function name; the first thing to change would be
# to load this from a configuration file or similar source instead.

PROJ=cloud-function-ts-example

# This region seems to work well for me, all the others are presumably about the same.
REGION=us-central1

# GCF has several ways to deploy. The path that makes the most sense using a
# build process is to deploy from local files. When deploying from local files,
# you need a Google cloud bucket to store the deployables. I created one (whose
# name is below) in the same example project. You will need to create your own
# bucket (easily done in the Google cloud web console for your project to put
# your deployables in).

BUCKET=cloud-function-ts-example

# One current weak point of GCF is that each function must be deployed
# separately. A real application making significant use of GCF will likely
# several functions, currently there is no way to deploy them jointly,
# transactionally, or quickly.

FNAME=hello
gcloud beta functions deploy $FNAME --region $REGION --stage-bucket $BUCKET --project $PROJ --trigger-http

# Upon success, it will print the URL.
