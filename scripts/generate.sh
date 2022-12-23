#!/bin/bash
set -e
cd "$(dirname "$0")"

flutter pub run build_runner build --delete-conflicting-outputs
flutter format --fix -l 80 .