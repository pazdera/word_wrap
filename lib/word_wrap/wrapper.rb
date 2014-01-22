# Wrapping implementation

# TODO: share code between wrap and fit implementations

module WordWrap
  class Wrapper
    def initialize(text, width)
      @text = text
      @width = width
    end

    def fit
      lines = []
      next_line = ""
      continued = false
      @text.lines do |line|
        line.chomp! "\n"
        if line.length == 0
          if next_line.length > 0
            lines.push next_line
            next_line = ""
          end
          lines.push ""
        end

        words = line.split " "

        words.each do |word|
          word.chomp! "\n"

          if next_line.length + word.length < @width
            if next_line.length > 0
              next_line << " " << word
            else
              next_line = word
            end
          else
            if word.length >= @width
              lines.push next_line unless next_line == ""
              lines.push word
              next_line = ""
            else
              lines.push next_line
              next_line = word
            end
          end
        end
      end

      lines.push next_line
      lines.join("\n") + "\n"
    end

    def wrap
      output = []

      @text.lines do |line|
        line.chomp! "\n"
        if line.length >= @width
          output_line = ""

          parts = line.split(/( )/).select { |s| s.length > 0 }
          parts.each do |part|
            if output_line.length + part.length < @width
              output_line += part
            else
              if part.length >= @width
                output.push output_line unless output_line == ""
                output.push part
                output_line = ""
              else
                output.push output_line
                output_line = part
              end
            end
          end
          output.push output_line if output_line.length > 0
        else
          output.push line
        end
      end
      output.join("\n") + "\n"
    end
  end
end
