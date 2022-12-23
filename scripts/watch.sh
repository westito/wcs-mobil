#!/bin/bash
set -e
cd "$(dirname "$0")"

flutter pub run build_runner watch --delete-conflicting-outputs