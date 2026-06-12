#!/bin/bash

mkdir -p results_randomWalk

echo "run_tabular: starting ETD experiments"
./run_etd.sh randomWalk 10
echo "run_tabular: starting ETrace experiments"
./run_etrace.sh randomWalk 10
echo "run_tabular: starting PTD experiments"
./run_ptd.sh randomWalk 10

echo "run_tabular: generating plots"
python plots/plot.py
echo "run_tabular: complete"
