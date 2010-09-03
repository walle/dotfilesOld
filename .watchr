ENV["WATCHR"] = "1"
system 'clear'

def notify(message)
  title = "Watchr Test Results"
  if message.match /\s\d\spending/
    image = "~/.watchr_images/pending.png"
  else
    image = message.match(/\s0\s(errors|failures)/) ? "~/.watchr_images/passed.png" : "~/.watchr_images/failed.png"
  end
  system "notify-send '#{title}' '#{message}' -i #{image} -t 3000"
end

def run(cmd)
  puts(cmd)
  `#{cmd}`
end

def run_spec_file(file)
  system('clear')
  result = run(%Q(ruby -I"lib:spec" -rubygems #{file}))
  notify result.partition(/Finished in .*$/m)[1].strip rescue nil
  puts result
end

def run_all_specs
  system('clear')
  result = run "rake spec"
  notify result.partition(/Finished in .*$/m)[1].strip rescue nil
  puts result
end

def related_spec_files(path)
  Dir['spec/**/*.rb'].select { |file| file =~ /#{File.basename(path).split(".").first}_spec.rb/ }
end

def run_suite
  run_all_specs
end

watch('spec/spec_helper\.rb') { run_all_specs }
watch('spec/.*/.*_spec\.rb') { |m| run_spec_file(m[0]) }
watch('app/.*/.*\.rb') { |m| related_spec_files(m[0]).map {|tf| run_spec_file(tf) } }
watch('features/.*/.*\.feature') { run_all_features }

# Ctrl-\
Signal.trap 'QUIT' do
  puts " --- Running all specs ---\n\n"
  run_all_specs
end

@interrupted = false

# Ctrl-C
Signal.trap 'INT' do
  if @interrupted then
    @wants_to_quit = true
    abort("\n")
  else
    puts "Interrupt a second time to quit"
    @interrupted = true
    Kernel.sleep 1.5
    # raise Interrupt, nil # let the run loop catch it
    run_suite
  end
end

