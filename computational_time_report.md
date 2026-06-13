# Aggregate Computational Time Report

This report was reconstructed from the modification timestamps of generated `*_all_errors.pkl` result files.
It measures the active wall-clock span of each completed experiment batch. When an experiment was run in multiple separated steps, idle gaps between steps are excluded.

| Experiment batch | Result files | First result | Last result | Aggregate span |
| --- | ---: | --- | --- | --- |
| Tabular random walk | 14175 | 2026-06-12 20:16:16 | 2026-06-12 21:58:57 | 01:42:41 |
| LinearFA YChain, task 1 | 500 | 2026-06-13 01:05:30 | 2026-06-13 01:09:16 | 00:03:46 |
| LinearFA elevator, task 2 | 500 | 2026-06-13 01:09:30 | 2026-06-13 01:13:55 | 00:04:25 |
| Semi_LinearFA gridWorld, task 1 | 750 | 2026-06-13 01:30:41 | 2026-06-13 13:11:41 | 04:42:44 |
| Semi_LinearFA gridWorld2, task 2 | 600 | 2026-06-13 01:42:09 | 2026-06-13 13:57:58 | 05:15:04 |

## Semi-Linear Batch Split

The semi-linear experiments were performed in two separate steps: first `n=8,12`, then `n=16`.
The idle interval between those two steps is excluded from the aggregate time above.

| Experiment batch | Step | Result files | First result | Last result | Active span |
| --- | --- | ---: | --- | --- | --- |
| Semi_LinearFA gridWorld, task 1 | `n=8,12` | 500 | 2026-06-13 01:30:41 | 2026-06-13 04:11:51 | 02:41:10 |
| Semi_LinearFA gridWorld, task 1 | `n=16` | 250 | 2026-06-13 11:10:07 | 2026-06-13 13:11:41 | 02:01:34 |
| Semi_LinearFA gridWorld2, task 2 | `n=8,12` | 400 | 2026-06-13 01:42:09 | 2026-06-13 04:25:13 | 02:43:04 |
| Semi_LinearFA gridWorld2, task 2 | `n=16` | 200 | 2026-06-13 11:25:58 | 2026-06-13 13:57:58 | 02:32:00 |

## Totals

| Scope | Result files | Aggregate computational time |
| --- | ---: | --- |
| LinearFA only | 1000 | 00:08:11 |
| Semi_LinearFA only | 1350 | 09:57:48 |
| All completed result batches found | 16525 | 11:48:40 |

## Notes

- These times do not include plotting time, failed/incomplete experiments, or idle gaps between separated experiment steps.
- Batch spans are reconstructed independently from file timestamps, so overlapping runs or reused/generated prerequisite files can make summed totals differ from elapsed wall-clock time.
- No completed `NonLinearFA/results_*` directories were present when this report was generated.
- The linear plots regenerated from the `LinearFA` result files are:
  - `LinearFA/plots/task1_learning_curve_test.pdf`
  - `LinearFA/plots/task2_learning_curve_test.pdf`
- The semi-linear plots regenerated from the `Semi_LinearFA` result files are:
  - `Semi_LinearFA/plots/Semi_Grid_task1_test.pdf`
  - `Semi_LinearFA/plots/Semi_Grid_task2_test.pdf`
