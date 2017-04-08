class ModifyRecruits < ActiveRecord::Migration[5.0]
  def change
    add_index :recruits, :applicant_id, unique: true, name: 'applicant_id_index'
  end
end
