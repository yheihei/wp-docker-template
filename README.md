# WordPress+WP-CLI+PHPUnit環境をDockerで動かす
* Dockerを使ったWordPress+WP-CLI+PHPUnit環境をビルドスクリプト一発で作ることができる環境です
* テーマテストの初期化スクリプトを使い、すぐにテスト駆動開発の準備が整います
# 構成
* アプリケーションサーバー:WordPressコンテナ
* DBサーバー:mysqlコンテナ
# 使い方
## 初回起動方法
```
$ git clone https://github.com/yheihei/wp-docker-template.git
$ cd wp-docker-template
$ ./build.sh
$ docker-compose up
```
## サイトへのアクセス
```
http://localhost:8000
```
## 管理画面へのアクセス
```
http://localhost:8000/wp-admin/
```
### 初期ログイン情報
ユーザー： yhei  
パスワード: password  
## 2回目以降の起動方法
```
$ docker-compose up
```
## 停止方法
```
$ docker-compose down
```
## 開発方法
```
wordpress/wp-content
```
配下が、ローカルとコンテナ間で同期されます。  
ローカルの`wp-content/themes`配下や、`wp-content/plugins`配下に開発したいプラグインやテーマを配置し、開発を行ってください。
## php.iniの編集
ローカルの`php/php.ini`を編集し、docker再起動すると反映されます
## テーマテスト方法
### テスト構成初期化
```
$ docker-compose exec wordpress bash
root@wordpress:/var/www/html# sudo /bin/sh init_wp_test.sh
root@wordpress:/var/www/html# cd wp-content/themes/<テーマ名>/
root@wordpress:/var/www/html/wp-content/themes/<テーマ名># ./init_wp_theme_test.sh
テーマのテストが可能な状態になりました
```
### テスト実行
```
root@wordpress:/var/www/html/wp-content/themes/<テーマ名># phpunit 
Installing...
Running as single site... To run multisite, use -c tests/phpunit/multisite.xml
Not running ajax tests. To execute these, use --group ajax.
Not running ms-files tests. To execute these, use --group ms-files.
Not running external-http tests. To execute these, use --group external-http.
PHPUnit 7.5.9 by Sebastian Bergmann and contributors.

  Warning - The configuration file did not pass validation!
  The following problems have been detected:

  Line 11:
  - Element 'testsuite': The attribute 'name' is required but missing.

  Test results may not be as expected.




Time: 1.29 seconds, Memory: 32.50 MB

No tests executed!
```
tests/配下のファイルがテスト対象となる。  
デフォルトの`test-sample.php`は`phpunit.xml.dist`で除外指定がされているので注意
