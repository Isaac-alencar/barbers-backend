# Start from the official Ruby image
FROM ruby:3.2.0

ENV RAILS_ENV=production

ARG ARG_RAILS_MASTER_KEY
ARG ARG_BARBER_SHOPS_API_DATABASE_USERNAME
ARG ARG_BARBER_SHOPS_API_DATABASE_PASSWORD
ARG ARG_BARBER_SHOPS_API_DATABASE_HOST
ARG ARG_BARBER_SHOPS_API_DATABASE_NAME

ENV RAILS_MASTER_KEY=$ARG_RAILS_MASTER_KEY
ENV BARBER_SHOPS_API_DATABASE_USERNAME=$ARG_BARBER_SHOPS_API_DATABASE_USERNAME
ENV BARBER_SHOPS_API_DATABASE_PASSWORD=$ARG_BARBER_SHOPS_API_DATABASE_PASSWORD
ENV BARBER_SHOPS_API_DATABASE_HOST=$ARG_BARBER_SHOPS_API_DATABASE_HOST
ENV BARBER_SHOPS_API_DATABASE_NAME=$ARG_BARBER_SHOPS_API_DATABASE_NAME

# Install Node.js and Yarn (needed for Rails asset compilation)
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Set the working directory
WORKDIR /myapp

# Add the Gemfile and Gemfile.lock to the image
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application into the image
COPY . /myapp

# RUN rails db:migrate

# Expose the port that the Rails server will run on
EXPOSE 3000

# Define the command to start the server
CMD ["rails", "server", "-b", "0.0.0.0"]