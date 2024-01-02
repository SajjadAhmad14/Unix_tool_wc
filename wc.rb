class WordCoutTool
  def initialize(args)
    @arguments = args
  end

  def main
    if @arguments.length != 2
      p "No file or command is found!"
      return
    end
    unless @arguments[1].include?("text") || @arguments[1].include?("txt")
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
    else
      p "nothing"
    end
  end

  private

  def number_of_bytes
    file = @arguments[1]
    size = File.size(file)
    print size, " ", @arguments[1]
  end

  def number_of_lines
    file = @arguments[1]
    lines = IO.readlines(file)
    print lines.length, " ", @arguments[1]
  end

  def number_of_words
    file = @arguments[1]
    lines = IO.readlines(file)
    num_lines = lines.length
    text = lines.join
    words_count = text.split.length
    print words_count, " ", @arguments[1]
  end
end

tool = WordCoutTool.new(ARGV)
tool.main
