#!/bin/bash -eu

. $(dirname $0)/../../scripts/om-cmd

om_cmd --request-timeout 7200 delete-unused-products

om_cmd --request-timeout 7200 export-installation --output-file backup-artifact/installation.zip
