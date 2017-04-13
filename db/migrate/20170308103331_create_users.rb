class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false                            # ユーザー名
      t.integer :win, default: 0                                         # 勝ち数
      t.integer :lose, default: 0                                        # 負け数
      t.integer :draw, default: 0                                        # 引き分け数
      t.integer :score, default: 0                                       # 持ち点
      t.timestamps
    end
  end
end
