class ShapeInfosController < ApplicationController
  def index
    scope = ShapeInfo.all
    @shapes = ListRgoShapesService
                  .new(scope, params[:keyword])
                  .call
                  .paginate(page: params[:page])
  end

  def import
    SaveRgoShapesService.new.call
    redirect_to(root_path)
  end

  def map
    @results = []
    @shapes = ShapeInfo.limit(5)
    @shapes.each do |shape|
      geo = Geocoder.search(shape.nuts_name)
      if geo.present?
        coordinates = geo.first.coordinates 
        @results << {
          lat: coordinates[0],
          long: coordinates[1],
          nuts_name: shape.nuts_name,
          nuts_id: shape.nuts_id,
          point_x: shape.point_x,
          point_y: shape.point_y
        }
      end
    end
    @results
  end

end
