# WordPressテストセットアップ

THEME_NAME=$1
echo $1
if [ "$THEME_NAME" = "" ]; then
  echo 'テーマ名を指定してください'
  exit 1
fi

ORG_DIR=`pwd`
echo "$ORG_DIR"
cd wp-content/themes/$THEME_NAME
echo $?
sudo mysqladmin --host=test_db --user=wordpress_test --password=wordpress_test drop wordpress_test
bash bin/install-wp-tests.sh wordpress_test wordpress_test 'wordpress_test' test_db latest
if [ "$?" != "0" ]; then
  cd $ORG_DIR
  echo "テーマのテストセットアップに失敗しました"
fi
