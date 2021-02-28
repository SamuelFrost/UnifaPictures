# Get started with a development environment:
#### * you will need to contact unifa for an access key if you wish to utilize the api connected in this application
Ensure your ruby version is up to date with your preferred method
* Ruby version 2.7.0
* Rails version 6.1.3
### Clone source code
example:
```
git clone https://github.com/SamuelFrost/UnifaPictures.git
```
#### *All further instructions assume you are executing the commands from the project root directory. If you just cloned the project you can navigate via the cli with 
```
cd UnifaPictures
```

### Install gem dependencies with bundler
```
bundler
```
Depending on your setup you may need to install gems with
```
bundler install
```
If you encounter a problem, you may need to install the bundler gem (currently using Bundler version 2.2.11)
```
gem install bundler
```
### Database initialization:
For first time:
```
rails db:setup
```
For full reset
```
rails db:reset
```
For incremental migrations
```
rails db:migrate
rails db:seed
```
### Running development environment:
Start up rails and access it via a browser at the displayed url, which should default to something like http://127.0.0.1:3000
```
rails start
```

# How to run the test suite:

```
rails test
```