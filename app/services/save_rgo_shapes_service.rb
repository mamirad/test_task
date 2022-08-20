require 'rgeo/shapefile'

class SaveRgoShapesService

  def initialize
    @file_source = Rails.root.join("public/s/NUTS_LB_2021_3035")
  end

  def call
    shape_objs = []
    open_file.each{ |record| shape_objs << build_shape(record) }
    ShapeInfo.import shape_objs
  end

  private

  def open_file
    RGeo::Shapefile::Reader.open(file_source)
  end

  def build_shape record
    ShapeInfo.find_or_initialize_by(build_shape_hash(record))
  end

  def build_shape_hash record
    geometry = record.geometry
    attrs = record.attributes.transform_keys(&:downcase)
    attrs.deep_merge!({ index:record.index, point_x: point_x(geometry), point_y: point_y(geometry)})
  end

  def point_x geometry
    geometry.x
  end

  def point_y geometry
    geometry.y
  end

  attr_reader :file_source
  
end