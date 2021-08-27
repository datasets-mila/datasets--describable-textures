#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

for file_url in \
	"https://www.robots.ox.ac.uk/~vgg/data/dtd/download/README.txt README.txt"
do
        echo ${file_url} | git-annex addurl --raw --batch --with-files
done

for file_url in \
	"https://www.robots.ox.ac.uk/~vgg/data/dtd/download/dtd-r1.0.1.tar.gz dtd-r1.0.1.tar.gz" \
	"https://www.robots.ox.ac.uk/~vgg/data/dtd/download/dtd-r1.0.1-labels.tar.gz dtd-r1.0.1-labels.tar.gz" \
	"https://www.robots.ox.ac.uk/~vgg/data/dtd/download/dtd-r1-decaf_feats.tar.gz dtd-r1-decaf_feats.tar.gz"
do
        echo ${file_url} | git-annex addurl -c annex.largefiles=anything --raw --batch --with-files
done

md5sum dtd-*.tar.gz > md5sums
