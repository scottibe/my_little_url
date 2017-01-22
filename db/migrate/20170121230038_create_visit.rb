class CreateVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :country
      t.string :ip_address 
      t.datetime :created_at
      t.datetime :updated_at
    end  
  end
end
