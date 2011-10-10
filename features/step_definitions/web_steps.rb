Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end


When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if defined?(Spec::Rails::Matchers)
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then /^(?:|I )should see \/([^\/]*)\/(?: within "([^\"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    if defined?(Spec::Rails::Matchers)
      page.should have_xpath('//*', :text => regexp)
    else
      assert page.has_xpath?('//*', :text => regexp)
    end
  end
end
Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^(?:|I )follow "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end