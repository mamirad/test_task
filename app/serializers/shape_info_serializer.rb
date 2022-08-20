class ShapeInfoSerializer < ActiveModel::Serializer
  attributes :id, :index, :lat, :long, :nuts_id,
             :nuts_name, :mount_type, :urbn_type, :coast_type,
             :fid, :levl_code, :cntr_code, :name_latn
end
