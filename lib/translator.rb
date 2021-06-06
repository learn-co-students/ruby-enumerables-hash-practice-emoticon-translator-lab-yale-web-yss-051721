require 'yaml'

# Write a method that loads the emoticons.yml file.

def load_library(path)
  emoticons = YAML.load_file(path)
  result= {}

  emoticons.each do |key,emotion|
    result[key] = {}
    result[key][:english] = emotion[0]
    result[key][:japanese] = emotion[1]
  end
  result
end

# get japanese meaning:
# accepts two arguments, the YAML file path and the emoticon
# calls on #load_library and gives it the argument of the file path
# returns the Japanese equivalent of an English emoticons

def get_japanese_emoticon(path, emotion)
  hash = load_library(path) 
  emotion = hash.keys.find do |key|
    hash[key][:english] == emotion
  end
  emotion ? hash[emotion][:japanese] :"Sorry, that emoticon was not found"
  end

def get_english_meaning(path, emotion)
  hash = load_library(path) 
  emotion = hash.keys.find do |key|
    hash[key][:japanese] == emotion
  end
  emotion ? emotion :"Sorry, that emoticon was not found"
  end
