# README


ユーザーテーブルのカラムはdb/migrate/20170308103331_create_users.rbに詳しく記述
----------------------------------------------------------------
_2017/03/14_


APIs


・全ユーザーのid、ユーザー名、勝ち、負け、引き分け、スコアを高スコア順に取得


GET [host]/users.json


・指定したユーザーの詳細情報を取得


GET [host]/users/[:id].json

・ユーザー名で検索


GET [host]/users/search.json?q=[:name]


・新アカウントの追加


GET  [host]/users/new.json でアカウントテンプレートを取得した後、テンプレートのユーザー名とパスワードを任意に変更し、


POST [host]/users.json     を行う
