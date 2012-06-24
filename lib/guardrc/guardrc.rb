module Guardrc
  def Guardrc.at(path)
    @path = File.expand_path(path)
    if File.exists?(@path)
      File.open(@path, 'r') { |f| f.read }
    else
      "puts 'Guard-compatible file not found #{@path}'"
    end
  end
end
