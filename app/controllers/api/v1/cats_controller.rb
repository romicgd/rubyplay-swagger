module Api
  module V1
    class CatsController < ApplicationController


      swagger_controller :cats, 'Cats'

      swagger_api :index do
        summary 'Returns all cats'
        notes 'Notes...'
      end

      def index
        render json: Cat.includes(:hobbies), include: ['hobbies']
      end

      def create
        cat = ::Cat.new(user_params)

        if cat.save
          render json: cat, status: :created
        else
          render_error(cat, :unprocessable_entity)
        end
      end


      private

      def user_params
        puts 'string'
        puts params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)

      end

    end
  end
end