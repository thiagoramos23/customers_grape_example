module API
  module ErrorFormatter
    def self.call message, backtrace, options, env
      { :response_type => 'error', :message => message }.to_json
    end
  end
end

