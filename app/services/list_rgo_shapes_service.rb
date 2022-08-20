class ListRgoShapesService
  def initialize scope, keyword
    @scope = scope
    @keyword = keyword
  end

  def call
    scope.then { |shapes| filter_shapes(shapes)}
  end

  private

  attr_reader :scope, :keyword

  def filter_shapes shapes
    return shapes if keyword.blank?
    ShapeInfo.search keyword
  end
end