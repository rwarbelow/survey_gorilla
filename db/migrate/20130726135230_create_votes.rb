class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.string :user_email, null: false
  		t.references :response

  		t.timestamps
  	end
  end
end
