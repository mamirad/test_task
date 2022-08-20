class ShapeInfo < ApplicationRecord
  scope :search, ->(keyword) {
    where(column_names
      .map {|attr| "#{attr}::text ILIKE '%#{keyword}%'"}
      .join(" or ")
    )
  }
end
