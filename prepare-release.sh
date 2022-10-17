#!/bin/bash

# Packaging specific files that are needed for the to run the solution and put them in the dist folder so we don't specify file name.
mkdir -p dist

# Get targets.
targets=$(tr "\n\r" " " < "./release-targets.txt")

# Change the * to specifc files best suited for your project.
zip -qq -r "dist/Release_$1.zip" $targets