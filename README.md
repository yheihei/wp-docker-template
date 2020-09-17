# 初回起動方法
```
$ git clone https://github.com/yheihei/wp-docker-template.git
$ cd wp-docker-template
$ ./build.sh
```
# 2回目以降の起動方法
```
$ docker-compose up
```
# 停止方法
```
$ docker-compose down
```
# WordPressインストール設定
```
http://localhost:8000
```
にアクセスすると、WordPressのインストール画面が出ます。  
通常のWordPressと同じようにインストールしてください。
# 開発方法
```
wordpress/wp-content
```
配下が、ローカルとコンテナ間で同期されます。  
ローカルの`wp-content/themes`配下や、`wp-content/plugins`配下に開発したいプラグインやテーマを配置し、開発を行ってください。
# php.iniの編集
ローカルの`php/php.ini`を編集し、docker再起動すると反映されます