# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # take_yaml: converts a String with YAML data into @data
  # parameter: yaml - a String in YAML format
  require 'yaml'

  def take_yaml(yaml)

    survey = YAML.safe_load(yaml)
    keys_array = survey[0].keys
    value_array = []
    survey.each do |record|
      record.each_value { |value| value_array << value }
    end

    record = {}
    keys_array.each_index { |index| record[keys_array[index]] = value_array[index].chomp }
    survey.push(record)
    survey.pop
    @data = survey

  end
  
  # to_yaml: converts @data into yaml string
  # returns: String in YAML format
  def to_yaml
    @data.to_yaml
  end
end
  