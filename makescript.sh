#!/usr/bin/env/ bash
platform='unknown'
unamestr=`uname`
if [[ "$(expr substr $(uname -s) 1 10)" == 'Linux' ]]; then
    platform='linux'
elif [[ "$(uname)" == 'Darwin' ]]; then
    platform='darwin'
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    platform='mingw32_nt'
fi

if [[ $platform == 'linux' || $platform == 'mingw32_nt' ]]; then
    doc2dash -fv --name Pythonista -d build -i icon.png --index-page index.html pythonista-docs
    cd _build && tar --exclude='.DS_Store' -cvzf Pythonista.tgz Pythonista.docset
elif [[ $platform == 'darwin' ]]; then
    doc2dash -fv --name Pythonista -i icon.png --index-page index.html -A pythonista-docs
fi