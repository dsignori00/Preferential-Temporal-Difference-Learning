import time


class Progress:
	def __init__(self, total, label, unit="episodes", min_interval=10):
		self.total = max(1, total)
		self.label = label
		self.unit = unit
		self.min_interval = min_interval
		self.start_time = time.time()
		self.last_print_time = self.start_time
		self.checkpoint = max(1, self.total // 10)
		self.enabled = self.total > 20
		self.started = False

	def _format_time(self, seconds):
		seconds = max(0, int(seconds))
		hours, remainder = divmod(seconds, 3600)
		minutes, seconds = divmod(remainder, 60)
		return f"{hours:02d}:{minutes:02d}:{seconds:02d}"

	def update(self, completed):
		if not self.enabled:
			return
		if completed != self.total and completed % self.checkpoint != 0:
			return

		now = time.time()
		elapsed = now - self.start_time
		if completed == self.total and elapsed < self.min_interval:
			return
		if completed != self.total and now - self.last_print_time < self.min_interval:
			return

		if not self.started:
			print(f"{self.label}: starting {self.total} {self.unit}", flush=True)
			self.started = True
		avg_time = elapsed / max(1, completed)
		remaining = avg_time * (self.total - completed)
		percent = 100.0 * completed / self.total
		print(
			f"{self.label}: {completed}/{self.total} {self.unit} "
			f"({percent:.1f}%) elapsed {self._format_time(elapsed)} "
			f"eta {self._format_time(remaining)}",
			flush=True,
		)
		self.last_print_time = now
