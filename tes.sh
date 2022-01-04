#!/bin/bash
v1=$(head -6 custom.json | tail -1 | cut -b 2-6)
echo "$v1"