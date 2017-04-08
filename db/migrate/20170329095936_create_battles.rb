class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.references :applicant             # 申し込み側ユーザーid
      t.references :authorizer                         # 受け取り側ユーザーid
      t.integer :winner_id                             # 勝ったほうのid、結果が出ていなければnil
      t.time :getup, null: false                  # 対戦時刻、文字列で扱い、24時制表記
      t.timestamps
    end

    add_foreign_key :battles, :users, column: :applicant_id
    add_foreign_key :battles, :users, column: :authorizer_id
  end
end
