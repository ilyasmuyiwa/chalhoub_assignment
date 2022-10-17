#!/bin/bash

mkdir -p ~/Sites/magento;
wrd=$(pwd);
cp -r $wrd/* ~/Sites/magento;
cd ~/Sites/magento
curl -s https://raw.githubusercontent.com/markshust/docker-magento/master/lib/template | bash
bin/download 2.4.5
bin/setup magento.test
open https://magento.test
