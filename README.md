# Infinities ∞

**INFINITY ∞ for the infinitely lazy.**

[![Gem Version](https://badge.fury.io/rb/infinities.svg)](http://badge.fury.io/rb/infinities)
[![Build Status](https://travis-ci.org/fny/infinities.svg?branch=master)](https://travis-ci.org/fny/infinities)

Annoyed by typing `Float::INFINITY`? Wish you could just use the word or symbol instead?

    require 'infinities/symbols'
    ∞ # => Infinity
    
    require 'infinities/words'
    INFINITY # => Infinity

If you require `BigDecimal` before loading any infinities, you get more goodies:

    require 'bigdecimal'
    
    require 'infinities/symbols'
    BIG∞ # => #<BigDecimal:2428b80,'Infinity',9(9)>
    
    require 'infinities/words'
    BIG_INFINITY # => #<BigDecimal:2428b80,'Infinity',9(9)>

*Note `BIG∞` is not available on Rubinius until a [certain issue is resolved](https://github.com/rubinius/rubinius/issues/3382).*

Require the whole shebang with `require 'infinites/all'`
