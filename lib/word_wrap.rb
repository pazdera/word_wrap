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
  def wrap(width=DEFAULT_WIDTH)
    WordWrap.ww(self, width, false)
  end

  def fit(width=DEFAULT_WIDTH)
    WordWrap.ww(self, width, true)
  end
end
