# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'infinities'
  spec.version       = '1.0.0'
  spec.authors       = ["Faraz Yashar"]
  spec.email         = ['faraz.yashar@gmail.com']

  spec.summary       = "INFINITY ∞ for the infinitely lazy."
  spec.description   = "Too lazy to type out Float::INFINITY or BigDecimal::INFINITY? " \
                       "∞ = INFINITY = Float::INFINITY; BIG∞ = BIG_INFINITY = BigDecimal::INFINITY"
  spec.homepage      = 'https://github.com/fny/infinities'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.6.0'
end
