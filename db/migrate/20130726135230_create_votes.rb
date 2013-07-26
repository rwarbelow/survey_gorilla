class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.references :user_email, null: false
  		t.references :response_id

  		t.timestamps
  	end
  end
end
