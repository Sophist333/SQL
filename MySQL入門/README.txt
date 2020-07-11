▶01 MySQLを使ってみよう

#カレントディレクトリ表示
[vagrant@localhost mysql_lessons]$ pwd

#MySQLサーバーが動いているかどうか確認
[vagrant@localhost mysql_lessons]$ sudo service mysqld status

#mysqlのrootユーザがパスワードなしで既に設定されている　→　MySQLサーバーに接続
[vagrant@localhost mysql_lessons]$ mysql -u root

mysql> help;

※Ctrl + Lで画面クリア
※セミコロンで終わるのがルール

#user確認
mysql> select user()　
    -> ;
    
mysql> select user()
    -> \c

#終了
mysql> \q (quit;)

▶03 データベースを操作してみよう

[vagrant@localhost mysql_lessons]$ mysql -u root

#データベースの作成
mysql> create database mydb01;
mysql> create database mydb02;
mysql> create database mydb03;

#表示
mysql> show databases;
#削除
mysql> drop database mydb03;
mysql> show databases;

#操作対象にする
mysql> use mydb02;
mysql> select database();

※mysql サーバーに投げるコマンドを、「クエリ」と言ったりするので用語として覚えておこう
※mysqlのクエリでは大文字小文字が区別されない

▶04 作業用ユーザーを設定しよう

※データベースごとに作業用ユーザーを設定してあげるのが一般的

#dbuser01 という名前で localhost からアクセスしてくるユーザーを設定 + pass設定
mysql> create user dbuser01@localhost identified by '6AVAkig2';

#dbuser01 に対して mydb01 の全てのテーブルに関する全ての権限を与える
mysql> grant all on mydb01.* to dbuser01@localhost;
mysql> quit;

[vagrant@localhost mysql_lessons]$ mysql -u dbuser01 -p mydb01
passward:6AVAkig2

mysql> select user();
mysql> show databases;
mysql> quit;

[vagrant@localhost mysql_lessons]$ mysql -u root
mysql> drop database mydb01;
mysql> drop database mydb02;

#ユーザー削除（ユーザー名とどこからアクセスしているのかを dbuser01@localhost のように指定）
mysql> drop user dbuser01@localhost;

▶05 外部ファイルのコマンドを実行しよう

[vagrant@localhost mysql_lessons]$ mysql -u root < create_myapp.sql
[vagrant@localhost mysql_lessons]$ mysql -u myapp_user -p myapp
mysql> quit;
[vagrant@localhost mysql_lessons]$ mysql -u root
mysql> \. ./create_myapp.sql
