#!/bin/bash



# update assets as edxapp user

sudo -H -u edxapp bash << EOF

source /edx/app/edxapp/edxapp_env

cd /edx/app/edxapp/edx-platform

paver update_assets lms --settings=aws --debug
paver update_assets cms --settings=aws --debug

EOF



# restart lms instance

sudo /edx/bin/supervisorctl restart edxapp:lms
sudo /edx/bin/supervisorctl restart edxapp:cms
