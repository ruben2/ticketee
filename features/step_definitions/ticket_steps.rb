Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    attributes.merge!(:user => User.find_by_email!(email))
    ticket = @project.tickets.create!(attributes)
    ticket.tag!(tags) if tags
  end
end

When /^I attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path)) # express the regexp above with the code you wish you had
end