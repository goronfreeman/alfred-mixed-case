require "json"

def letter?(look_ahead)
  look_ahead.match?(/[[:alpha:]]/)
end

def mixed_case(string, upcase: true)
  string.each_char.map do |char|
    next char unless letter?(char)

    (upcase = !upcase) ? char.upcase : char.downcase
  end.join
end

input  = ARGV[0].split(" ")
output = input.map { |string| mixed_case(string) }.join(" ")

json =
  { items: [
    {
      uid: "mixedcase",
      title: output,
      arg: output
    }
  ] }.to_json

print json
