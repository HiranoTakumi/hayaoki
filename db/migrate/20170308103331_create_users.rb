class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false                            # ユーザー名
      t.integer :win                                         # 勝ち数
      t.integer :lose                                        # 負け数
      t.integer :draw                                        # 引き分け数
      t.integer :score                                       # 持ち点
      t.timestamps
    end
  end
end
