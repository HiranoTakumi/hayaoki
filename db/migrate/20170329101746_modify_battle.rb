class ModifyBattle < ActiveRecord::Migration[5.0]
  def change
#    add_index :battles, :applicant_id, name: 'applicant_index'
#    add_index :battles, :authorizer_id, name: 'authorizer_index'
    add_index :battles, :getup, name: 'getup_index'
  end
end
