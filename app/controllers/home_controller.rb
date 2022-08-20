class HomeController < ApplicationController
  def index
    @shapes = ShapeInfo.all
  end

  def import_shapes
    SaveRgoShapesService.new.call
    redirect_to(root_path)
  end
end
