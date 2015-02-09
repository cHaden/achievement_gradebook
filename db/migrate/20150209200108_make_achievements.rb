class MakeAchievements < ActiveRecord::Migration
  def change
    create_table :achievements_students do |t|
      t.integer :achievement_id
      t.integer :student_id
    end

    drop_table :grades
  end
end
