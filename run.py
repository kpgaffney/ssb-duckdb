import argparse
import subprocess
import time

import duckdb


def main(scale_factors, trials):
    queries = ['Q1.1', 'Q1.2', 'Q1.3', 'Q2.1', 'Q2.2', 'Q2.3', 'Q3.1', 'Q3.2', 'Q3.3', 'Q3.4', 'Q4.1', 'Q4.2', 'Q4.3']

    print('Building SSB data generator.')
    subprocess.run(
        '''
        mkdir -p dbgen/build
        cmake -Bdbgen/build -Hdbgen -DCMAKE_BUILD_TYPE=Release
        cmake --build dbgen/build
        ''',
        capture_output=True, shell=True)

    results = []

    for scale_factor in map(int, scale_factors.split(',')):
        print(f'Generating SSB data for scale factor {scale_factor}.')
        subprocess.run(
            f'''
            cd dbgen/build
            rm -f ./*.tbl
            ./dbgen -b ../dists.dss -s {scale_factor}
            ''',
            capture_output=True, shell=True)

        for variant in ['standard', 'widetable']:
            print(f'Using variant {variant}.')

            cursor = duckdb.connect()

            print('Loading data into DuckDB.')
            with open(f'sql/standard/load.sql', 'r') as f:
                cursor.execute(f.read())
            if variant == 'widetable':
                with open(f'sql/widetable/load.sql', 'r') as f:
                    cursor.execute(f.read())

            print('Running the benchmark.')
            for trial in range(trials):
                for query in queries:
                    with open(f'sql/{variant}/queries/{query}.sql', 'r') as f:
                        sql = f.read()
                        start_time = time.time()
                        cursor.execute(sql).fetchall()
                        end_time = time.time()
                        results.append([scale_factor, variant, trial, query, round(end_time - start_time, 5)])

    print('Writing results.')
    with open('results/results.csv', 'w') as f:
        print('Scale Factor,Variant,Trial,Query,Time', file=f)
        for row in results:
            print(','.join(map(str, row)), file=f)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Run SSB on DuckDB')
    parser.add_argument('--scale_factors', type=str, default='1')
    parser.add_argument('--trials', type=int, default=5)
    args = parser.parse_args()
    main(args.scale_factors, args.trials)
