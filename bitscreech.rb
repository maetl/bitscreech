c=%w(p b t d k g x j f v l r m y s z)
v=%w(a e i o u an en in un on a ei oi ui aw ow)
t=""
u=[?\s]*9+[". ",".\n\n"]
q=->x{x[-2]=~/[.\n]/}
50000.times{rand(1..6).times{|i|t<<(i<1&&q[t]?c.sample.upcase: c.sample)+v.sample};t<<u.sample}
q[t]||t[-1]=?.
puts t
