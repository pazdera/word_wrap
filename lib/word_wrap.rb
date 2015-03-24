# Copyright (c) 2014 Radek Pazdera
# Distributed under the MIT License

require "word_wrap/version"
require "word_wrap/wrapper"

module WordWrap
  DEFAULT_WIDTH=80

  def self.ww(text, width=DEFAULT_WIDTH, fit=false)
    w = Wrapper.new(text, width)
    fit ? w.fit : w.wrap
  end
end

class String
  def wrap(width=WordWrap::DEFAULT_WIDTH)
    WordWrap.ww(self, width, false)
  end

  def wrap!(width=WordWrap::DEFAULT_WIDTH)
    replace wrap(width)
  end

  def fit(width=WordWrap::DEFAULT_WIDTH)
    WordWrap.ww(self, width, true)
  end

  def fit!(width=WordWrap::DEFAULT_WIDTH)
    replace fit(width)
  end
end
