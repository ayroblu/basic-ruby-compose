FROM ruby:2.4.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN wget -qO- https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get install -yq nodejs yarn

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY yarn.lock /myapp/yarn.lock
RUN yarn install --frozen-lockfile --production && yarn cache clean
COPY . /myapp
