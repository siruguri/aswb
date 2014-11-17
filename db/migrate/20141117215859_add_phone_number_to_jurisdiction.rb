class AddPhoneNumberToJurisdiction < ActiveRecord::Migration
  def change
    add_column :jurisdictions, :phone_number, :string
  end
end
