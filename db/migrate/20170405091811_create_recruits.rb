class CreateRecruits < ActiveRecord::Migration[5.0]
  def change
    create_table :recruits do |t|
      t.references :applicant, null: false            # 申込ユーザーid
      t.integer :authorizer_id         # 受け取りユーザーid
      t.datetime :getup, null: false                  # 起床時刻
      t.timestamps
    end

    add_foreign_key :recruits, :users, column: :applicant_id
  end
end
