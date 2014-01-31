class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
    	t.string :home_team
    	t.string :away_team
    	t.integer :home_goals
    	t.integer :away_goals
    	t.string :fixture_date
    	t.string :winner
    	t.string :mom
      t.timestamps
    end
  end
end
