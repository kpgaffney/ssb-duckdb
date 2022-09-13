# SSB on DuckDB

Experiments with SSB on DuckDB.

## Instructions

First, make sure you have Python installed (version 3.6 or newer). Optionally, create and activate a new virtual environment. Then, install the DuckDB Python package (`pip install duckdb`). Finally, run the benchmark:
```
python run.py --scale_factors=SCALE_FACTORS --trials=TRIALS
```
Replace `SCALE_FACTORS` with a comma separated list of SSB scale factors. Replace `TRIALS` with the number of trials to run for each query.

The script will output a CSV file `results/results.csv` containing the latency of each query.

To produce the plots, run the notebook `results/plot.ipynb`.
