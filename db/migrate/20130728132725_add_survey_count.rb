class AddSurveyCount < ActiveRecord::Migration
  def change
    add_column :surveys, :participant_count, :integer, default: 0
  end
end
