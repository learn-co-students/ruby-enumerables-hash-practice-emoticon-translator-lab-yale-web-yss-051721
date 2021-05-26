# require modules here
require "yaml"
def load_library(path)
  orig = YAML.load_file(path)
  ans = {}
  orig.each do |name,arr|
    ans[name] = {}
    ans[name][:english] = arr[0]
    ans[name][:japanese] = arr[1]
  end
  ans
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  lib = load_library(path)
  ans = lib.find do |name,vers|
    vers[:english] == emoticon
  end
  ans ? ans[1][:japanese] : "Sorry, that emoticon was not found"
end


def get_english_meaning(path, emoticon)
  # code goes here
  lib = load_library(path)
  ans = lib.find do |name,vers|
    vers[:japanese] == emoticon
  end
  ans ? ans[0] : "Sorry, that emoticon was not found"
end