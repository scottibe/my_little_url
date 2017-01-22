class CreateUrl < ActiveRecord::Migration
  def change
    create_table :url do |t|
      t.string :original
      t.datetime :created_at
      t.datetime :updated_at
    end  
  end
end
