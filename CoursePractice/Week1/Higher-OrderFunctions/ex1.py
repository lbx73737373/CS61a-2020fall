def maker_adder(n):
	"""
		返回一个以k为参数，返回k + n的函数
	"""
	def adder(k):
		return k + n;
	
	return adder


