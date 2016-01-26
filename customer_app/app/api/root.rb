module API
  class Root < Grape::API
    prefix 'api'
    error_formatter :json, API::ErrorFormatter

    # rescue_from ActiveRecord::RecordInvalid do |error|
    #   message = error.record.errors.messages.map { |attr, msg| msg.first }
    #   error!(message.join(", "), 404)
    # end

    rescue_from :all do |e|
      eclass = e.class.to_s
      message = nil
      status = case
               when eclass.match("ActiveRecord::RecordInvalid")
                 message = e.record.errors.messages.map {|attr, msg| attr.to_s.camelize + " " + msg.first }
                 404
               when eclass.match('RecordNotFound'), e.message.match(/unable to find/i).present?
                 404
               else
                 (e.respond_to? :status) && e.status || 500
               end
      opts = { response_type: "error" }
      opts[:message] = message || "#{e.message}"
      opts[:trace] = e.backtrace[0,10] unless Rails.env.production?
      Rack::Response.new(opts.to_json, status, {
        'Content-Type' => "application/json",
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Request-Method' => '*',
      }).finish
    end

    mount API::V1::Root
  end
end

