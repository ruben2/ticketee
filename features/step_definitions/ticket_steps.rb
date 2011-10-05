Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  with_scope(selector) do
     if defined?(Spec::Rails::Matchers)
       page.should have_xpath('//*', :text => text)
     else
       assert page.has_xpath?('//*', :text => text)
     end
  end
end

