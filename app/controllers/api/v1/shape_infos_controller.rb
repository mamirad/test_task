module Api
  module V1
    class ShapeInfosController < ActionController::API

      def index
        scope = ShapeInfo.all
        @shapes = ListRgoShapesService
                      .new(scope, params[:keyword])
                      .call
        render json: @shapes

      end
    end
  end
end

