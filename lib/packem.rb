class Packem

  def self.build
    puts 'Building Your Newsletter...'
    self.validate_html('./index.html')
    self.create_textfile
    # TODO: self.create_zipfile
    puts "\nBuild finished."
  end

  def self.create_textfile
    premailer = Premailer.new('./index.html', :warn_level => Premailer::Warnings::SAFE)
    text = premailer.to_plain_text
    data = []

    text.each_line do |line|
      line.gsub!('http://unsubscribe','<unsubscribe />') # for Sendingo system (http://sendingo.pl/)
      data << line
    end

    File.open('./index.txt', 'w+') do |fout|
      fout.puts data
    end

    true
  end

  def self.validate_html(file)
    validator = MarkupValidator.new
    validator.set_debug!(true)

    results = validator.validate_file(file)

    puts "\nCHECKING FILE:"
    puts "#{file}..."

    if results.errors.length > 0
      results.errors.each do |err|
        puts "\n#{err.to_s}"
      end
    else
      puts 'Valid!'
    end

    puts "\nDebugging messages:"

    results.debug_messages.each do |key, value|
      puts "#{key}: #{value}"
    end
  end


end