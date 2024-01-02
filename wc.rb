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
    else
      p "nothing"
    end
  end

  private

  def number_of_bytes
    file = @arguments[1]
    size = File.size(file)
    p size
  end
end

tool = WordCoutTool.new(ARGV)
tool.main
