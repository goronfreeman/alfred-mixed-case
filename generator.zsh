input_string=$(echo $1 | tr '\n' ' ')
input_array=(${(s::)input_string})
output_array=()

for char in $input_array; do
  if [ $[${RANDOM}%2] = 0 ]; then
    output_array+="$(echo $char | awk '{print tolower($0)}')"
  else
    output_array+="$(echo $char | awk '{print toupper($0)}')"
  fi
done

output_string=${(j::)output_array}

cat << EOB
{"items": [
  {
    "uid": "mixedcase",
    "title": "$output_string",
    "arg": "$output_string"
  }
]}
EOB
