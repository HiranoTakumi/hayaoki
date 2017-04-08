=======
# README



## テーブル  
### User  
### Battle  
### Recruit
テーブルの詳細及びAPIはWikiを参照  


## 処理の流れ  
あるユーザー(申し込み側: applicant)がRecruitテーブルに対戦募集レコードを作成する。このとき、対戦相手を指定するかは任意だが、対戦時刻は必ず指定する。  
もう一人のユーザー(受け取り側: authorizer)は募集レコードの中から対戦したいレコードを選択し、対戦が成立する。  
対戦が成立するとBattleテーブルにレコードが登録され、そのidが各ユーザーに渡される。起床時刻を迎えたとき、そのidを使ってレコードにアクセスする。  
先にアクセスしたユーザーが勝利となり、ユーザーレコードが更新される。対戦時刻から5分以上経過しても両ユーザーからのアクセスがなかった場合、両者とも引き分けとなる。  


## 備考
基本的にログインは無し(今のところ)  
ユーザーidにはデータベースの主キーを用い、各ユーザーは自分のidのみ所持できるものとする  
したがって、あるユーザーが他のユーザーを検索する場合はユーザー名を用いるが、コントローラ内でidに変換してデータベースの検索を行う
自分のアカウントのデータを操作する場合はユーザーidを要求する  
対戦募集のレコードはRecruitテーブルで管理し、対戦が成立したらBattleテーブルにレコードを保存する。そのとき、Recruitテーブルのレコードは削除される
対戦中はBattleテーブルの主キーをクライアント側で保持し、試合終了後に破棄する  
