source ~/build-env/set_var
\
printf "
+++++++++++++++++++++
rubyに必要なものである
rbenv ruby-build readline
をインストールします。
+++++++++++++++++++++
"
brew install rbenv ruby-build readline
brew install readline
brew link readline --force
echo 'eval "$(rbenv init -)"' >> ~/.$ENV_FILE
source ~/.zshrc
export CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl`"
export RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --disable-install-doc --with-openssl-dir=`brew --prefix openssl`"
printf "
+++++++++++++++++++++
rubyをインストールします。
かなり時間がかかります。
+++++++++++++++++++++
"
echo n |rbenv install $GLOBAL_RUBY_VER
rbenv global $GLOBAL_RUBY_VER
rbenv rehash
printf "
+++++++++++++++++++++
rubyの導入が完了しました。

次はターミナルで
source ~/build-env/mysql
を実行してください。
+++++++++++++++++++++
"
