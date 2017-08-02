#!/bin/bash

failed_items=""
function install_package() {
echo EXECUTING: brew install $1 $2
brew install $1 $2
[ $? -ne 0 ] && $failed_items="$failed_items $1" # package failed to install.
}
brew tap 
brew tap caskroom/cask
brew tap homebrew/core
brew tap homebrew/dupes
brew tap homebrew/services
brew tap homebrew/versions
brew tap rcmdnk/file
install_package ack ''
install_package aria2 ''
install_package augeas ''
install_package autoconf ''
install_package automake ''
install_package bash-completion ''
install_package brew-file ''
install_package brew-pip ''
install_package certbot ''
install_package chromedriver ''
install_package cmake ''
install_package coreutils ''
install_package cscope ''
install_package dialog ''
install_package direnv ''
install_package exercism ''
install_package fortune ''
install_package freetype ''
install_package gdbm ''
install_package git ''
install_package imagemagick ''
install_package jpeg ''
install_package libgpg-error ''
install_package libiconv ''
install_package libksba ''
install_package libpng ''
install_package libtiff ''
install_package libtool ''
install_package libxml2 ''
install_package libyaml ''
install_package macvim ''
install_package mas ''
install_package mongodb ''
install_package node ''
install_package node@6 ''
install_package openssl ''
install_package openssl101 ''
install_package openssl@1.1 ''
install_package pkg-config ''
install_package postgresql ''
install_package python ''
install_package readline ''
install_package sqlite ''
install_package tree ''
install_package wifi-password ''
install_package xz ''
install_package zlib ''
[ ! -z $failed_items ] && echo The following items were failed to install: && echo $failed_items
