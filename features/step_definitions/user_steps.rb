Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
		unconfirmed = attributes.delete("unconfirmed") == "true"
		@user = User.create!(:email => attributes["email"], :password => attributes["password"])
		@user.confirm! unless unconfirmed
  end
end


