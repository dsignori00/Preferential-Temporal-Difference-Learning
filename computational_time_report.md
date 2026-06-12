# Aggregate Computational Time Report

This report was reconstructed from the modification timestamps of generated `*_all_errors.pkl` result files.
It therefore measures the wall-clock span between the first and last result file in each completed experiment batch.

| Experiment batch | Result files | First result | Last result | Aggregate span |
| --- | ---: | --- | --- | --- |
| Tabular random walk | 14175 | 2026-06-12 20:16:16 | 2026-06-12 21:58:57 | 01:42:41 |
| LinearFA YChain, task 1 | 500 | 2026-06-13 01:05:30 | 2026-06-13 01:09:16 | 00:03:46 |
| LinearFA elevator, task 2 | 500 | 2026-06-13 01:09:30 | 2026-06-13 01:13:55 | 00:04:25 |

## Totals

| Scope | Result files | Aggregate computational time |
| --- | ---: | --- |
| LinearFA only | 1000 | 00:08:11 |
| All completed result batches found | 15175 | 01:50:52 |

## Notes

- These times do not include idle gaps between separate scripts, plotting time, or failed/incomplete experiments.
- No completed `Semi_LinearFA/results_*` or `NonLinearFA/results_*` directories were present when this report was generated.
- The linear plots regenerated from the `LinearFA` result files are:
  - `LinearFA/plots/task1_learning_curve_test.pdf`
  - `LinearFA/plots/task2_learning_curve_test.pdf`
