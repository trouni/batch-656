require 'yaml'
require 'date'

SSN_PATTERN = /^(?<gender>1|2) ?(?<year>\d{2}) ?(?<month>0[1-9]|1[0-2]) ?(?<department>\d[\dAB])(?: ?\d{3}){2} ?(?<key>\d{2})$/

def french_ssn_info(ssn)
  match_data = ssn.match(SSN_PATTERN)

  if match_data && key_valid?(match_data[:key].to_i, ssn)
    gender = match_data[:gender].to_i == 1 ? 'man' : 'woman'
    month = Date::MONTHNAMES[match_data[:month].to_i]
    year = match_data[:year]
    department = departments[match_data[:department]]

    "a #{gender}, born in #{month}, 19#{year} in #{department}."
  else
    "The number is invalid"
  end
end

def departments
  file = File.open("data/french_departments.yml")
  YAML.load(file)
end

def key_valid?(key, ssn)
  ssn_without_key = ssn[0...-2].gsub(' ', '').to_i
  key == (97 - ssn_without_key) % 97
end
