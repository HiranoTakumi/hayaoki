class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.integer :applicant, null: false             # 申し込み側ユーザーid
      t.integer :authorizer                        # 受け取り側ユーザーid
      t.boolean :condition                          # trueなら試合中もしくは試合終了、falseなら申し込み中
      t.boolean :flag                               # 初期状態でfalse、先にtrueにしたほうが勝ち
      t.integer :result                             # 勝った方のユーザーid、引き分けなら-1
      t.string :getup, null: false                  # 対戦時刻、文字列で扱い、24時制表記
      t.timestamps
    end
  end
end
