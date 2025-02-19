# README

Make sure you have Ruby installed. If you don't we recommend using [Ruby Version Manager](https://rvm.io/) or [Rbenv](https://github.com/rbenv/rbenv) to install and manage your Ruby installs. See their websites on instructions on how to install the latest version of Ruby.

You will also need SQLite3 installed on your system. See [the Sqlite website](https://www.sqlite.org/) for instructions on installing for your environment.

Once you have Ruby installed and you have cloned this repo, install Bundler and run it to manage your Ruby gems. This will install Rails and any other required Ruby gems.

```
gem install bundler
bundle install
```

Once you have set up your database start the server by running

```
bin/rails server
```

to start the server running on port `3000`.

Congratulations, you have set up the Rails backend
