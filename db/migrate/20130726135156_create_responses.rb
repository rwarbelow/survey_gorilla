class CreateResponses < ActiveRecord::Migration
  def change
  	create_table :responses do |t|
  		t.references :question
  		t.string :text

  		t.timestamps
  	end
  end
end
