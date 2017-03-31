class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.integer :applicant, null: false             # 申し込み側ユーザーid
      t.integer :authorizer, null: false            # 受け取り側ユーザーid
      t.boolean :condition                          # trueなら試合終了、falseなら試合中及び申し込み中
      t.boolean :flag                               # 初期状態でfalse、先にtrueにしたほうが勝ち
      t.integer :result                             # 勝った方のユーザーid、引き分けなら-1
      t.time :getup, null: false                    # 対戦時刻
      t.timestamps
    end
  end
end
