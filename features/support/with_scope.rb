class String
  def csserize
    self.downcase.gsub(" ","-")
  end
end

  def with_scope(locator,css_type=nil)
    locator = convert_locator_to_css(locator,css_type) if locator and css_type
    locator ? within(locator) { yield } : yield
  end

  def convert_locator_to_css(locator,css_type)
    locator = locator.csserize
    return locator if locator =~ /^[.#]/
    css_type==:css_class ? ".#{locator}" : "##{locator}"
  end

