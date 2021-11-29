#!/bin/bash

set -eo pipefail

xcodebuild -project To-Do-List.xcodeproj \
            -scheme To-Do-List \
            -destination platform=iOS\ Simulator,OS=14.4,name=iPhone\ 11 \
            clean test | xcpretty
