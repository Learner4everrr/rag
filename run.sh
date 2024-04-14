#!/bin/bash



python 5_metrics.py --number 1000
wait

python 5_metrics.py --number 2000
wait

python 5_metrics.py --number 3000
wait

python 5_metrics.py --number 4000
wait

python 4_generation.py --number 5000
python 5_metrics.py --number 5000
wait
