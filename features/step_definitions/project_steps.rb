Given /^there is a project called "([^"]*)"$/ do |name|
  FactoryGirl.create(:project, :name => name)
end

