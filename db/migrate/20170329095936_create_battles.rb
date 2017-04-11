class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.references :applicant, null: false            # 申し込み側ユーザーid
      t.references :authorizer, null: false                         # 受け取り側ユーザーid
      t.integer :result                             # 対戦中はnil、applicant勝利で1、authorizer勝利で-1、引き分けで0
      t.datetime :getup, null: false                  # 対戦時刻
      t.timestamps
    end

    add_foreign_key :battles, :users, column: :applicant_id
    add_foreign_key :battles, :users, column: :authorizer_id
  end
end
