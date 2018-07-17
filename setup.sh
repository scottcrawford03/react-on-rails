#!/bin/bash
if which npm > /dev/null; then
    if which yarn > /dev/null; then
        echo "yarn installed already..."
    else
        echo "installing yarn..."
        npm install yarn --save
    fi
    
    echo "running yarn install..."
    yarn install
else
    echo "please install node and npm..."
    exit 1
fi

if which brew > /dev/null; then
    if brew ls --versions postgresql > /dev/null; then
        echo "postgresql installed already..."
    else
        brew install postgresql
    fi
    
    echo "starting postgresql..."
    brew services start postgresql
else
    echo "please install homebrew..."
    exit 1
fi

echo "bundle installing..."
bundle install

echo "running rake db:setup..."
rake db:setup

echo "everything setup! try running foreman start -f Procfile.dev -p 3000"