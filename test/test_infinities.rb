# coding: UTF-8
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/hell'

class TestInfinities < Minitest::Test
  # Since forking isn't available on JRuby, won't be able to test the requires
  if RUBY_ENGINE == 'jruby'
    require 'bigdecimal'
    require 'infinities/all'

    def test_jruby
      assert_all_infinities_equal
    end
  else
    def test_require_symbols
      assert_equal(Float::INFINITY, forked {
        assert require('infinities/symbols')
        ∞
      })
      forked do
        assert require('bigdecimal')
        assert require('infinities/symbols')
        assert_equal(BigDecimal::INFINITY, BIG∞) if RUBY_ENGINE != 'rbx'
      end
    end

    def test_require_words
      assert_equal(Float::INFINITY, forked {
        assert require('infinities/words')
        INFINITY
      })
      forked do
        assert require('bigdecimal')
        assert require('infinities/words')
        assert_equal BigDecimal::INFINITY, BIG_INFINITY
      end
    end

    def test_require_all
      assert(forked {
        assert require('bigdecimal')
        assert require('infinities/all')
        assert_all_infinities_equal
      })
    end
  end

  private

  def assert_all_infinities_equal
    assert_equal Float::INFINITY, ∞
    assert_equal Float::INFINITY, INFINITY
    assert_equal(BigDecimal::INFINITY, BIG∞) if RUBY_ENGINE != 'rbx'
    assert_equal BigDecimal::INFINITY, BIG_INFINITY
  end

  def forked
    read, write = IO.pipe

    pid = fork do
      read.close
      result = yield
      Marshal.dump(result, write)
      exit!(0) # Skips exit handlers
    end

    write.close
    result = read.read
    Process.wait(pid)
    raise "Child failed." if result.empty?
    Marshal.load(result)
  end
end
