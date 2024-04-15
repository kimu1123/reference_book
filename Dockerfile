FROM ruby:3.1.4
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
RUN npm install --global yarn

WORKDIR /reference_book_app
RUN gem install bundler:2.3.17
COPY Gemfile /reference_book_app/Gemfile
COPY Gemfile.lock /reference_book_app/Gemfile.lock
RUN bundle install
CMD ["rails", "server", "-b", "0.0.0.0"]