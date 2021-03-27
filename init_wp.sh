# WordPressセットアップ
wp core install --url='http://localhost:8000' --title='Dockerで作る新規サイト' --admin_user='yhei' --admin_password='password' --admin_email='yheihei0126@gmail.com' --allow-root

# 日本語化
wp language core install ja --activate --allow-root 

# タイムゾーンと日時表記
wp option update timezone_string 'Asia/Tokyo' --allow-root 
wp option update date_format 'Y-m-d' --allow-root 
wp option update time_format 'H:i' --allow-root

# プラグインの削除
wp plugin delete hello.php --allow-root

# プラグインのインストール
wp plugin install wp-multibyte-patch --activate --allow-root
#wp plugin install jetpack --active --allow-root
#wp plugin install backwpup --active --allow-root
#wp plugin install siteguard --active --allow-root

# テーマの削除
# wp theme delete twentyseventeen --allow-root
# wp theme delete twentyeighteen --allow-root
# wp theme delete twentynineteen --allow-root
# wp theme delete twentytwenty --allow-root
