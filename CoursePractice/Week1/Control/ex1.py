def search(f):
	"""
		high order function, 接受的参数f是一个函数的别名
	"""
	x = 0
	while f(x) == False:
		x += 1
	return x

def square(x):
	return x * x

def positive(x):
	return max(0, square(x)-100)
