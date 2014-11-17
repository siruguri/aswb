class CreateLicensedPractices < ActiveRecord::Migration
  def change
    create_table :licensed_practices do |t|
      t.integer :jurisdiction_id
      t.integer :practice_info_id
      t.text :education_experiences
      t.text :supervised_experiences
      t.string :exam_required
      t.boolean :board_approval
      t.integer :renewal_period_in_years
      t.integer :ce_in_hours
      t.text :special_ce_requirements
      t.boolean :provision_or_temp
      t.string :inactive_or_retired
      t.float :application_fee
      t.text :fees
      t.integer :renewal_schedule_in_years

      t.timestamps
    end
  end
end
