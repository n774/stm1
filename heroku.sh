#!/bin/bash
echo TRAVIS_BRANCH=${TRAVIS_BRANCH}
case ${TRAVIS_BRANCH} in
    master)
	echo "it's Master!"
   	wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
	git remote add heroku git@heroku.com:stm1.git
	echo "Host heroku.com" >> ~/.ssh/config
	echo "   StrictHostKeyChecking no" >> ~/.ssh/config
	echo "   CheckHostIP no" >> ~/.ssh/config
	echo "   UserKnownHostsFile=/dev/null" >> ~/.ssh/config
	heroku keys:remove
	yes | heroku keys:add
	yes | git push -f heroku master
	heroku pg:reset DATABASE --confirm studentssm1
	heroku run rake db:migrate
	heroku run rake db:seed
	heroku restart  
	;;

    release)
	echo "it's Release."
	wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
	git remote add heroku git@heroku.com:stm1.git
	echo "Host heroku.com" >> ~/.ssh/config
	echo "   StrictHostKeyChecking no" >> ~/.ssh/config
	echo "   CheckHostIP no" >> ~/.ssh/config
	echo "   UserKnownHostsFile=/dev/null" >> ~/.ssh/config
	heroku keys:remove
	yes | heroku keys:add
	yes | git push -f heroku HEAD:master
	heroku run rake db:migrate
	heroku restart
	;;

    *)
	echo "it's Other."
	exit 0
	;;
esac
