
def divide_exact(n=2013, d=10):
	"""
		Return the quotient and remainder of dividing N by D.
		

		>>> q, r = divide_exact(2013, 10)
		>>> q, r
		(201, 3)

	"""
	return n // d, n % d

q, r = divide_exact(2022, 10)
print("quotientn is :", q)
print("remiander is :", r)
