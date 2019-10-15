require 'yaml'

def load_library(file_path)

  load_file_hash = YAML.load_file(file_path)

  emoticon_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  load_file_hash.each do |hash_key, hash_value|

    emoticon_hash["get_meaning"][hash_value[1]] = hash_key
    emoticon_hash["get_emoticon"][hash_value[0]] = hash_value[1]

  end
  emoticon_hash
end

def get_japanese_emoticon(yaml_file, emoticon)
  library = load_library(yaml_file)
  returned_emoticon = library["get_emoticon"][emoticon]

  if !!returned_emoticon
     returned_emoticon
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml_file, emoticon)
  library = load_library(yaml_file)
  returned_emoticon = library["get_meaning"][emoticon]

  if !!returned_emoticon
    returned_emoticon
  else
    "Sorry, that emoticon was not found"
  end
end
