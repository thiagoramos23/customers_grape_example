module Repositories
  class BaseRepository

    def all
      model.all
    end

    def save_record record
      record.save!
    end

    def update_record record
      record.update
    end

    def create attributes
      model.create!(attributes)
    end

    def update_attributes(instance, attributes)
      instance.update_attributes(attributes)
    end

    def update(instance)
      instance.update
    end

    def remove(id)
      model.find(id).destroy!
    end

    private

    def model
      self.class._model
    end

    class << self
      def model_name model_name
        @model_name = model_name.capitalize
      end

      def _model
        @model_name.constantize
      end
    end
  end
end
