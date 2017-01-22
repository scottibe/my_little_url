class CreateLink < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :identifier
      t.datetime :created_at
      t.datetime :updated_at
    end  
  end
end
