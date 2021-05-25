# require modules here
require "yaml"
require "pry"
def load_library(filepath)
  # code goes here
  data=YAML.load_file(filepath)
  data=data.map{|key, values|
    [key, {english: values[0], japanese: values[1]}]
  }.to_h
end

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
  hash=load_library(filepath)
  pair=hash.find{
    |key, value|
    value[:english]==emoticon
  }
  if(pair==nil)
    return "Sorry, that emoticon was not found"
  end
  pair[1][:japanese]
end

def get_english_meaning(filepath, emoticon)
  # code goes here
  hash=load_library(filepath)
  pair=hash.find{
    |key, value|
    value[:japanese]==emoticon
  }
  if(pair==nil)
    return "Sorry, that emoticon was not found"
  end
  #binding.pry
  pair[0]
end