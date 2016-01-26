module API
  module V1
    class Root < Grape::API
      version 'v1'
      mount API::V1::Manager::Root
    end
  end
end

