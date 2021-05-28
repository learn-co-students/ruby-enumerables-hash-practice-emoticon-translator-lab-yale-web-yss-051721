# require modules here
require "pry"
require "yaml"


def load_library(file)
  # code goes here
  lib = YAML.load_file(file)
  
  final_lib = lib.each_with_object({}) do |(key, val), fin_arr|
    fin_arr[key] = { :english=>val[0], :japanese=>val[1] }
  end 
  final_lib

end

def get_japanese_emoticon(file, engl_emote)
  # code goes here
  lib = load_library(file)
  japan_emote = ""
  
  lib.each do |key, val|
    val.each do |inner_key, inner_val|
      if inner_val == engl_emote
        japan_emote += lib[key][:japanese]
      end
    end
  end 
  
  if japan_emote != ""
    japan_emote
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emote)
  # code goes here
  
  lib = load_library(file)
  fin_key = ""
  
  lib.each do |key, val|
    val.each do |inner_key, inner_val|
      if inner_val == emote
        fin_key += key
      end
    end
  end 
  
  if fin_key != ""
    fin_key
  else
    "Sorry, that emoticon was not found"
  end
  
end