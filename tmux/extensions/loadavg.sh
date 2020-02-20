#!/bin/bash

uptime | awk -F ':' '{print $NF}'
