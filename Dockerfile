# Use an official Ruby runtime as a parent image
FROM ruby:2.7

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Jekyll and its dependencies
RUN gem install bundler && bundle install

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 4000 for Jekyll
EXPOSE 4000

# Start the Jekyll server
CMD ["bundle", "exec", "jekyll", "s"]