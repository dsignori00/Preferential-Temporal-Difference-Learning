#!/bin/bash

mkdir -p results_YChain

total=$(( $(wc -l < YChain.txt) * $(wc -l < seed.txt) ))
completed=0
start_time=$(date +%s)
report_every=$((total / 100))
if [ "$report_every" -lt 1 ]; then
	report_every=1
fi

report_progress() {
	completed=$((completed + 1))
	if [ "$completed" -ne "$total" ] && [ $((completed % report_every)) -ne 0 ]; then
		return
	fi
	now=$(date +%s)
	elapsed=$((now - start_time))
	eta=$((elapsed * (total - completed) / completed))
	printf 'run_task1: %d/%d runs complete, elapsed %02d:%02d:%02d, eta %02d:%02d:%02d\n' \
		"$completed" "$total" \
		$((elapsed / 3600)) $(((elapsed % 3600) / 60)) $((elapsed % 60)) \
		$((eta / 3600)) $(((eta % 3600) / 60)) $((eta % 60))
}

while IFS=, read alg len lr;
do
	while read seed;
	do
		python $alg.py --seed="$seed" --lr="$lr" --len="$len" --env="YChain" --episodes=100
		report_progress
	done < seed.txt
done < YChain.txt

echo "run_task1: generating plots"
python plots/plot_ychain.py
