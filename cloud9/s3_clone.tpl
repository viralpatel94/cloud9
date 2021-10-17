#!/bin/bash

sudo aws s3 cp s3://${bucket} . --recursive
