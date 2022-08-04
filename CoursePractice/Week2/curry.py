def curry2(f):
	def g(x):
		def h(y):
			return f(x, y)
		return h
	return g

