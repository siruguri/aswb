class CreatePracticeInfos < ActiveRecord::Migration
  def change
    create_table :practice_infos do |t|
      t.string :title
      t.string :initials

      t.timestamps
    end
  end
end
