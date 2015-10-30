require 'byebug'

debugger

def find_symmetric_substrings(str, unmatched_substrings = [], result = [])
  if str == ""
    return []
  end
  arr = str.split(//)
  first_element = arr.shift

  unmatched_substrings.each do |pus|
    candidate_substring = pus + first_element
    if candidate_substring == candidate_substring.reverse && candidate_substring.length > 1
      result << candidate_substring
    end
    unmatched_substrings << candidate_substring
  end
  unmatched_substrings << first_element

  return find_symmetric_substrings(arr.join, unmatched_substrings, result)
end

p find_symmetric_substrings("xanax")

# New comment
