class CreateSurveys < ActiveRecord::Migration
  def change
  	create_table :surveys do |t|
  		t.references :user_id
  		t.string :title, null: false
  		t.text :description
  		t.integer :status, default: 1

  		t.timestamps
  	end
  end
end
