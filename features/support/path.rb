def path_to(page_name)
  case page_name

    when /the home\s?page/
      '/'
    when /the project page for "([^\"]*)"/
      project_path(Project.find_by_name!($1))


    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end