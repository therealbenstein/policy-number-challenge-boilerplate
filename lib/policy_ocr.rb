module PolicyOcr

  require_relative './string_decoder'
  require_relative './policy_reader'


end

puts 'asdf'
reader = PolicyOcr::PolicyNumberReader.new(nil)
reader.parse_files