require "word_wrap/version"

module WordWrap
  DEFAULT_WIDTH=80

  def self.word_wrap(text, width=DEFAULT_WIDTH, keep_spaces=false)
    lines = []
    next_line = ""
    text.lines do |line|
      line.chomp! "\n"
      if keep_spaces
        words = line.split(/( )/).select { |s| s.length > 0 }
      else
        words = line.split " "
      end

      words.each do |word|
        word.chomp! "\n"

        if next_line.length + word.length < width
          if next_line.length > 0 && !keep_spaces
            next_line << " " << word
          else
            next_line += word
          end
        else
          if word.length >= width
            lines.push next_line unless next_line == ""
            lines.push word
            next_line = ""
          else
            lines.push next_line
            next_line = word
          end
        end
      end
      lines.push next_line
      next_line = ""
    end

    lines.push next_line
    lines.join "\n"
  end

  def self.ww(text, width=DEFAULT_WIDTH, keep_spaces=false)
    word_wrap(text, width, keep_spaces)
  end
end

class String
  def ww(width=DEFAULT_WIDTH, keep_spaces=false)
    WordWrap.ww(self, width, keep_spaces)
  end
end
