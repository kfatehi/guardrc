module Guardrc
  @cache = ''
  def Guardrc.at(path)
    puts "Guardrc is looking for extra commands at #{path}" if path
    @path = File.expand_path(path)
    if File.exists?(@path)
      File.open(@path, 'r') { |f| @cache = f.read }
      puts "Guardrc has loaded your auxiliary commands!"
    else
      puts "Guardrc did not find any file at #{@path}"
    end
    return @cache
  end
end
