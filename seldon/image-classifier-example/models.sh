#!/usr/bin/env bash

# https://stackoverflow.com/questions/3822621/how-to-exit-if-a-command-failed
set -eu
set -o pipefail

if [ ! -d tf_cifar10 ]; then
	echo '[tf_cifar10] Downloading official example from Google Cloud Storage'

	gsutil cp -r gs://seldon-models/triton/tf_cifar10 .
fi
if ! mc stat smapp-teh1/seldon/tf_cifar10/; then
	echo '[tf_cifar10] Uploading to the Smapp S3 Storage to use with Seldon'
	mc cp -r tf_cifar10 smapp-teh1/seldon/
fi

if [ ! -d outlier-detector ]; then
	echo '[outlier-detector] Downloading official example from Google Cloud Storage'

	gsutil cp -r gs://seldon-models/scv2/examples/mlserver_1.3.5/cifar10/outlier-detector .
fi
if ! mc stat smapp-teh1/seldon/outlier-detector/; then
	echo '[outlier-detector] Uploading to the Smapp S3 Storage to use with Seldon'
	mc cp -r outlier-detector smapp-teh1/seldon/
fi

if [ ! -d drift-detector ]; then
	echo '[drift-detector] Downloading official example from Google Cloud Storage'

	gsutil cp -r gs://seldon-models/scv2/examples/mlserver_1.3.5/cifar10/drift-detector .
fi
if ! mc stat smapp-teh1/seldon/drift-detector/; then
	echo '[drift-detector] Uploading to the Smapp S3 Storage to use with Seldon'
	mc cp -r drift-detector smapp-teh1/seldon/
fi
