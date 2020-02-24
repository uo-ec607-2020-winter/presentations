def cdprofit(k,a,p,w,r):
  b = 1-a
  wr = w/p
  l = (b*(k**a)/wr)**(1/(1-b))
  return p*(k**a)*(l**b) - w*l - r*k
