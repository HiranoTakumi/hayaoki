class ModifyBattle < ActiveRecord::Migration[5.0]
  def change
    add_index :battles, :applicant, name: 'applicant_index'
    add_index :battles, :authorizer, name: 'authorizor_index'
    add_index :battles, :getup, name: 'getup_index'
  end
end
