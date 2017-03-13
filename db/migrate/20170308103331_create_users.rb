class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false                            # ユーザー名
      t.string :password, null: false                        # パスワード(端末情報)
      t.string :opponent                                     # 対戦相手名、nilなら非対戦中
      t.integer :win                                         # 勝ち数
      t.integer :lose                                        # 負け数
      t.integer :draw                                        # 引き分け数
      t.integer :score                                       # 持ち点
      t.integer :result                                      # 対戦結果 1:勝ち、-1:負け、0:引き分け、非対戦中はnil
      t.time :time                                           # 起床時刻、非対戦中はnil
      t.timestamps
    end
  end
end
