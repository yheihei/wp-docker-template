# WordPressテーマ毎のテストセットアップ処理
sudo mysqladmin --host=test_db --user=wordpress_test --password=wordpress_test drop wordpress_test
bash bin/install-wp-tests.sh wordpress_test wordpress_test 'wordpress_test' test_db latest
if [ "$?" != "0" ]; then
  cd $ORG_DIR
  echo "[error] テーマのテストセットアップに失敗しました"
  return 1
fi
echo "テーマのテストが可能な状態になりました"
