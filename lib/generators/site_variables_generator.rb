class SiteVariablesGenerator < Rails::Generators::Base
  def create_initializer_file
    create_file "config/site_variables.yml" do
      "shared:\n" \
      "\tthing: stuff goes here"\
      "\ndevelopment:"\
      "\n\tthing: development version of thing"
    end
    create_file "config/initializers/site_variables.rb" do
"      variables = YAML.load_file('config/variables.yml')

      SITE_VARIABLES = variables['shared']

      # override and shared variables with env specific ones.
      variables[Rails.env].each do |key, value|
        SITE_VARIABLES[key] = value
      end"
    end
  end
end