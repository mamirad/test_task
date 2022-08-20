class CreateShapeInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :shape_infos do |t|
      t.integer :index
      t.string :point_x
      t.string :point_y
      t.string :nuts_id
      t.string :nuts_name
      t.integer :mount_type
      t.string :urbn_type
      t.integer :coast_type
      t.string :fid
      t.integer :levl_code
      t.string :cntr_code
      t.string :name_latn

      t.timestamps
    end
  end
end
