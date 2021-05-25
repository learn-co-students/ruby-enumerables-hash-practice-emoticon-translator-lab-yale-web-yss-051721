# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  emote_dict = YAML.load_file(file)
  
  emote_dict.each_with_object({}) do |(key, array), final|
    final[key] = {
      :english => array[0],
      :japanese => array[1]
    }
  end 
end

def get_japanese_emoticon(file, emoticon)
  result = load_library(file).select do |key, value|
    value[:english] == emoticon
  end
  if !result.empty?
    return result.values[0][:japanese]
  else
    p "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  result = load_library(file).select do |key, value|
    value[:japanese] == emoticon
  end
  if !result.empty?
    return result.keys[0]
  else
    p "Sorry, that emoticon was not found"
  end
end