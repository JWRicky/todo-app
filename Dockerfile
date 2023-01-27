FROM ruby:2.5.1

#必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

#作業ディレクトリの設定
RUN mkdir /todo_app

#作業ディレクトリをAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV mkdir /todo_app
WORKDIR $APP_ROOT

#ホスト側(ローカル)のGemfileを追加する
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

#Gemfileのbundleをinstall
RUN bundle install
ADD . $APP_ROOT