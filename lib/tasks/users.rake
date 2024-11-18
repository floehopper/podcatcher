namespace :users do
  desc "Add a new user"
  task :add, [:email, :password] => :environment do |_, args|
    User.create!(email_address: args[:email], password: args[:password])
  end
end
