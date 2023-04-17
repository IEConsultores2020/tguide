FROM node:6.7.0
RUN npm install -g yarn
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && apt install -y nano
WORKDIR /tguide
COPY Gemfile /tguide/Gemfile
COPY Gemfile.lock /tguide/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
#RUN EDITOR=nano bundle exec rails credentials:edit
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
