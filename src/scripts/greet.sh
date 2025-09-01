#!/bin/bash

TO=$(circleci env subst "${PARAM_TO}")

echo "Hello ${TO:-World}!"
