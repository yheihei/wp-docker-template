FROM wordpress:latest

#wp-cli, phpunitのインストール
RUN apt update \
     && apt install -y sudo git default-mysql-client subversion \
     && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
     && chmod +x wp-cli.phar \
     && mv wp-cli.phar /usr/local/bin/wp \
     && wp --info \
     && curl -O https://phar.phpunit.de/phpunit-7.5.9.phar \
     && chmod +x phpunit-7.5.9.phar \
     && mv phpunit-7.5.9.phar /usr/local/bin/phpunit \
     && phpunit --version
