class ErrorLog
  def write(message)
    if File.exist?('log/error.log')
      File.write('log/error.log', "#{message}\n", mode: 'a')
    else
      Rails.logger.error message
    end
  end
end
