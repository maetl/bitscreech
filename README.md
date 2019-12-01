# Bitscreech

A [Nano-NaNoGenMo 2019](https://nickm.com/post/2019/11/nano-nanogenmo-or-nnngm/) entry, based on the larger entry [The Bitspeech Sonnets](https://github.com/maetl/bitspeech-sonnets).

This uses the Bitspeech lookup tables of consonants and vowels to generate an asemic stream of words formatted into semi-rhythmic sentences and paragraph breaks.

## Details

- [Entry on the NaNoGenMo 2019 repo](https://github.com/NaNoGenMo/2019/issues/140)
- [Output of a 50,000 word ‘book’](https://github.com/maetl/bitscreech/blob/master/book.md)

## Run

No external dependencies or setup is required aside from having Ruby installed. To generate a ‘book’ run `bitscreech.rb` and redirect its output to a file.

```
ruby bitscreech.rb > book.md
```

## Source

```ruby
c=%w(p b t d k g x j f v l r m y s z)
v=%w(a e i o u an en in un on a ei oi ui aw ow)
t=""
u=[?\s]*9+[". ",".\n\n"]
q=->x{x[-2]=~/[.\n]/}
50000.times{rand(1..6).times{|i|t<<(i<1&&q[t]?c.sample.upcase: c.sample)+v.sample};t<<u.sample}
q[t]||t[-1]=?.
puts t
```

This comes in at 255 or 256 characters on Linux or OSX depending on whether the trailing newline is counted. Presented here with line breaks for readability, but because the newline on Windows is `\r\n`, to come under the limit on that platform would require concatenating into a single line with `;` separators.

The only substantive modification to the original consonant and vowel lookup tables is changing the _ch_ digraph to _x_ which meant I could drop a few extra characters by using `String#upcase` in place of `String#capitalize`. This extra space was needed in order to fold in the sentence and paragraph formatting.

## License

The MIT License (MIT)

Copyright © 2019 Mark Rickerby https://maetl.net

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
