class WordCoutTool
  def initialize(args)
    @arguments = args
    @file = @arguments[1]
  end

  def main
    if @arguments.length == 0
      p "No file or command is found!"
      return
    end
    if @arguments.length == 1
      @file = @arguments[0]
    end
    unless @file.include?("text") || @file.include?("txt")
      p "Text files only!"
      return
    end

    case @arguments[0]
    when "-c"
      number_of_bytes
    when "-l"
      number_of_lines
    when "-w"
      number_of_words
    when "-m"
      number_of_chars
    else
      # count words, chars, lines, and bytes when no option is found
      count_everything
    end
  end

  private

  def number_of_bytes
    file = @file
    size = File.size(file)
    print size, " ", @arguments[1]
  end

  def number_of_lines
    file = @file
    lines = IO.readlines(file)
    print lines.length, " ", @arguments[1]
  end

  def number_of_words
    file = @file
    lines = IO.readlines(file)
    num_lines = lines.length
    text = lines.join
    words_count = text.split.length
    print words_count, " ", @arguments[1]
  end

  def number_of_chars
    file = @file
    lines = IO.readlines(file)
    num_lines = lines.length
    text = lines.join
    chars_count = text.length
    print chars_count, " ", @arguments[1]
  end

  def count_everything
    number_of_lines
    number_of_words
    number_of_bytes
    print " ", @file
  end
end

tool = WordCoutTool.new(ARGV)
tool.main
