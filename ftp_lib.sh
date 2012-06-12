#!/bin/bash

echo "Reading configuration..."

source ftp_config.txt

echo "Done!"

function upload_live {
	echo "Doing FTP upload to live site..."

	git ftp push -s $NAME-live

	echo "Done!"
}

function upload_dev {
        echo "Doing FTP upload to dev site..."

        git ftp push -s $NAME-dev

        echo "Done!"
}

function init {
	echo "Reading configuration..."

	source ftp_config.txt

	echo "Done!"


	echo "Creating GIT repository..."

	git init

	echo "Done!"


	echo "Creating .gitignore..."

	echo "ftp_config.txt" > .gitignore

	echo "Done!"


	echo "Creating initial commit..."

	echo "Repository $NAME created!" > .created

	git add .created

	git commit -a -m "Initial commit"

	echo "Done!"


	echo "Initializing FTP connection..."

	LIVE_URL_PATH="$USERNAME:$PASSWORD@$SERVER$LIVE_FOLDER"

	git ftp add-scope $LIVE_NAME-live $LIVE_URL_PATH


        DEV_URL_PATH="$USERNAME:$PASSWORD@$SERVER$DEV_FOLDER"

        git ftp add-scope $DEV_NAME-dev $DEV_URL_PATH

	echo "Done!"


	echo "Doing initial FTP upload of live..."

	git ftp init -s $NAME-live

	echo "Done!"


	echo "Doing initial FTP upload of dev..."

        git ftp init -s $NAME-dev

        echo "Done!"

}
