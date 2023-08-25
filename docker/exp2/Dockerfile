FROM ruby:3.0

WORKDIR /app

COPY . .


RUN gem install faker
RUN gem install json

ENV FILE_PATH="./Output.json"

CMD [ "ruby" , "exer.rb" ]