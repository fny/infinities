# coding: UTF-8
# Needs to be defined as a method since ∞ is an invalid constant name
def ∞
  Float::INFINITY
end

if defined?(BigDecimal) && RUBY_ENGINE != 'rbx'
  BIG∞ = BigDecimal::INFINITY
end
