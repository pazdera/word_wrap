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
  def ww(width=DEFAULT_WIDTH, fit=false)
    WordWrap.ww(self, width, fit)
  end
end
