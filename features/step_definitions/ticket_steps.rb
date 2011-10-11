Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    state = attributes.delete("state")
    ticket = @project.tickets.create!(attributes.merge!(:user => User.find_by_email!(email)))
    ticket.state = State.find_or_create_by_name(state) if state
    ticket.tag!(tags) if tags
    ticket.save
  end
end

When /^I attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path)) # express the regexp above with the code you wish you had
end