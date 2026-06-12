#!/bin/bash

total=$(( $(wc -l < interest.txt) * $(wc -l < lamb.txt) * $(wc -l < lr.txt) * $(wc -l < seed.txt) ))
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
	if [ "$completed" -gt 0 ]; then
		eta=$((elapsed * (total - completed) / completed))
	else
		eta=0
	fi
	printf 'run_etd: %d/%d runs complete, elapsed %02d:%02d:%02d, eta %02d:%02d:%02d\n' \
		"$completed" "$total" \
		$((elapsed / 3600)) $(((elapsed % 3600) / 60)) $((elapsed % 60)) \
		$((eta / 3600)) $(((eta % 3600) / 60)) $((eta % 60))
}

while read intr;
do
	while read lam;
	do
		while read lr;
		do
			while read seed;
			do
				python etd.py --seed="$seed" --lr="$lr" --lamb="$lam" --intrst="$intr" --env=$1 --episodes=$2
				report_progress
			done < seed.txt
		done < lr.txt
	done < lamb.txt
done < interest.txt
