ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  # Add more helper methods to be used by all tests here...
end

module SignInHelper
  def sign_in_as_test
    # puts BCrypt::Password.new(user.password_digest)
    post sessions_path('session' => {"username" => "Test", "password" => "BecausemynameisSam"}, "commit"=>"ログイン")
  end
end
module SignOutHelper
  def sign_out
    delete sessions_path
  end
end
