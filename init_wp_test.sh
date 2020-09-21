# WordPressテストセットアップ

# テーマフォルダ毎にテスト初期化する
cd /var/www/html/wp-content/themes/
for THEME_NAME in `ls -d */`
do
  echo $THEME_NAME
  if [ ! -e ./$THEME_NAME/tests ]; then
    echo "$THEME_NAME のテスト初期化"
    wp scaffold theme-tests --dir=/var/www/html/wp-content/themes/$THEME_NAME --allow-root
    chown -R www-data /var/www/html/wp-content/themes/$THEME_NAME
  fi
done