source ~/build-env/set_var
\
printf "
++++++++++++++++++++++++++++++++++++++++++
rubyに必要なものである
rbenv ruby-build readline openssl
をインストールします。
++++++++++++++++++++++++++++++++++++++++++
"
brew install rbenv ruby-build readline openssl
brew install readline
brew link readline --force
echo 'eval "$(rbenv init -)"' >> ~/.$ENV_FILE
source ~/.$ENV_FILE
export CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl`"
export RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --disable-install-doc --with-openssl-dir=`brew --prefix openssl`"
printf "
++++++++++++++++++++++++++++++++++++++++++
rubyをインストールします。
かなり時間がかかります。
++++++++++++++++++++++++++++++++++++++++++
"
echo n |rbenv install $GLOBAL_RUBY_VER
rbenv global $GLOBAL_RUBY_VER
rbenv rehash
printf "
++++++++++++++++++++++++++++++++++++++++++
rubyの導入が完了しました。
++++++++++++++++++++++++++++++++++++++++++
"
printf "
++++++++++++++++++++++++++++++++++++++++++
rubyの導入が完了しました。
++++++++++++++++++++++++++++++++++++++++++
"
printf "
++++++++++++++++++++++++++++++++++++++++++
このままmysqlの導入を行う場合は
yを入力してEnterを押してください。

あとでmysqlの導入を行う場合はターミナルで
source ~/build-env/mysql
を実行してください。
++++++++++++++++++++++++++++++++++++++++++
"
read input
if [ $input != y -a $input != ｙ ] ; then
  printf "
++++++++++++++++++++++++++++++++++++++++++
終了します
++++++++++++++++++++++++++++++++++++++++++
"
  return 2>&- || exit
fi

source ~/build-env/mysql
