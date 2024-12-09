module PolicyOcr
  class PolicyNumberReader
    def initialize(dir)
      @directory = dir || './policies/'
    end

    def parse_files()
      files = Dir.entries(@directory)
      puts 'lflsadfhldhfals'
      puts files.inspect
      files.each do |file|
        parse_file(file)
      end
    end

    def parse_file(file)
      file_path = "#{@directory}#{file}"
      return nil unless File.file?(file_path)
      data = File.read(file_path)
      puts data.inspect
      policy_numbers = []
      data.to_a.each_slice(4) do |slice|
        policy_numbers << GlyphDecoder.decode_lines(slice)
      end
      puts policy_numbers.inspect
      File.open("#{@directory}decoded_#{file_path}", "w") do |f|
        f.write(policy_numbers.join("\n"))
      end
      File.rename("#{@directory}/#{filename}", "#{@directory}/archived/#{filename}")
    end

  end
end