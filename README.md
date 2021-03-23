# Overview
This is a project that a company requested I make as part of an interview process. I made it from scratch according to the design documents given to me (in Japanese). See Task Specifications pdf for details.

It highlights an picture uploading application that communicates with a third party twitter clone API to share uploaded images from the app servers.

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
### Credentials
For unifa employees, I will share the master.key file, so you can simply copy the file into the config directory. And rails will be able to decode the encoded credentials.yml.enc file.

Contact Unifa for API credentials *I am not affiliated with Unifa directly, so I don't have any say in them giving you an account.

If the master.key file is not available, you may edit the credentials and paste the appropriate secret keys in.
```
EDITOR=vi bin/rails credentials:edit
```
replace the appropriate codes for the following keys
```
unifa_client_id: client_id_code
unifa_client_secret: client_secret_code
```
If you do this, note that you should not commit the credentials if you want to contribute.

### Running development environment:
Start up rails and access it via a browser at the displayed url, which should default to something like http://127.0.0.1:3000
```
rails start
```

# How to run the test suite:

```
rails test
```
