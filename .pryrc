def formatted_env
  case Rails.env
  when 'production'
    bold_upcased_env = Pry::Helpers::Text.bold(Rails.env.upcase)
    Pry::Helpers::Text.red(bold_upcased_env)
  when 'staging'
    Pry::Helpers::Text.yellow(Rails.env)
  when 'development'
    Pry::Helpers::Text.green(Rails.env)
  else
    Rails.env
  end
end

def app_name
  File.basename(Rails.root)
end

if defined?(Rails)
  Pry.config.prompt = proc { |obj, nest_level, _| "[#{app_name}][#{formatted_env}] #{obj}:#{nest_level}> " }
end

# if defined?(PryByebug)
#   Pry.commands.alias_command 'c', 'continue'
#   Pry.commands.alias_command 's', 'step'
#   Pry.commands.alias_command 'n', 'next'
#   Pry.commands.alias_command 'f', 'finish'
# end

if ENV['VIM']
  Pry.config.pager = false
end
