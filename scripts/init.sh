#!/bin/bash

set -x

IVENTOY_BOOTSTROP_FOLDER=/iventoy-bs
IVENTOY_DIR=/iventoy
IVENTOY_BIN_FILE=$IVENTOY_DIR/lib/iventoy
IVENTOY_CONFIG_FILE=$IVENTOY_DIR/data/config.dat

if [ ! -d "$IVENTOY_DIR" ]; then
    mkdir $IVENTOY_DIR
fi

if [ ! -f "$IVENTOY_BIN_FILE" ]; then
    # bootstrap iventoy
    if [ -d "$IVENTOY_BOOTSTROP_FOLDER" ]; then
        if [ ! -d "$IVENTOY_DIR/data" ]; then
            cp -r $IVENTOY_BOOTSTROP_FOLDER/data $IVENTOY_DIR/data
        else
            if [ -z "$(ls -A $IVENTOY_DIR/data)" ]; then
                cp -ar $IVENTOY_BOOTSTROP_FOLDER/data/. $IVENTOY_DIR/data/
            fi
        fi

        if [ ! -d "$IVENTOY_DIR/iso" ]; then
            mkdir $IVENTOY_DIR/iso
        fi

        if [ -d "$IVENTOY_DIR/lib" ]; then
            rm -rf "$IVENTOY_DIR/lib"
        fi
        cp -r $IVENTOY_BOOTSTROP_FOLDER/lib $IVENTOY_DIR/lib

        if [ ! -d "$IVENTOY_DIR/user" ]; then
            cp -r $IVENTOY_BOOTSTROP_FOLDER/user $IVENTOY_DIR/user
        else
            if [ -z "$(ls -A $IVENTOY_DIR/user)" ]; then
                cp -ar $IVENTOY_BOOTSTROP_FOLDER/user/. $IVENTOY_DIR/user/
            fi
        fi

        cp -r $IVENTOY_BOOTSTROP_FOLDER/doc $IVENTOY_DIR/doc
        cp $IVENTOY_BOOTSTROP_FOLDER/iventoy.sh $IVENTOY_DIR/iventoy.sh
        mkdir $IVENTOY_DIR/log
        rm -rf $IVENTOY_BOOTSTROP_FOLDER
    else
        printf "bootstrap file missing"
        error 1
    fi
fi

exec "$@"