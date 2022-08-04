def trace1(fn):
	def traced(x):
		print('Calling', fn, 'on Arguments', x)
		return fn(x)
	return traced
	
@trace1
def square_with_decorator(x):
	return x*x

def square(x):
	return x*x

