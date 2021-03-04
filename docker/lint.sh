#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_archives/ tests/

black democritus_archives/ tests/

mypy democritus_archives/ tests/

pylint --fail-under 9 democritus_archives/*.py

flake8 democritus_archives/ tests/

bandit -r democritus_archives/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_archives/ tests/
