module Guardrc
  def Guardrc.at(path)
    @path = path
    if File.exists?(path)
      File.open(@path, 'r') { |f| f.read }
    else
      "puts 'Guardrc not found: #{path} not loaded'"
    end
  end
end
