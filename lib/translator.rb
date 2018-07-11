require 'yaml'

def load_library(file_path)
  emoticons =YAML.load_file(file_path)
#yaml is basically coding slang to write array, hashes etc much quicker
# we are going to convert that file by using YAML....('the file with .yml')
emoticons_hash = { "get_meaning" => {}, "get_emoticon" =>{}}
# this is creating two keys within a hash

emoticons.each do |english_word, emoticon_set|
  # we are going to take the hash emoticons and do the below on each

  emoticons_hash["get_meaning"][emoticon_set.last] = english_word
# the value of english word will equal to the key within the get meaning hash that equals japenese translation
     emoticons_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
# the key inside the "get_emoticon" hash will be the first element in the emoticon_set which is the english
# it will then point to the japanese verson of the the emoji
  end
  emoticons_hash
  #we are now returning a new hash
end

def get_japanese_emoticon(file_path, emoticon)
  #takes the file path and the english emoticon

emoticon_hash = load_library(file_path)
#we will assign the value of load_library(file) to emoticons_hash
result = emoticon_hash["get_emoticon"][emoticon]
# the result will equal the value of the emoticon we are taking into account as
# becuase in the load_library method we put the emoticons as keys in a hash
if result == nil
  result = "Sorry, that emoticon was not found"
end
result
end

def get_english_meaning(file_path, emoticon)
emoticon_hash = load_library(file_path)
result = emoticon_hash["get_meaning"][emoticon]
if result == nil
  result = "Sorry, that emoticon was not found"
end
result
end
