module NavigationHelpers
  def path_to(page_name)
    case page_name
    
  
    when /login\s?page/
      '/sessions/new'
    when /system\s?page/
      '/users'
    when /admin\s?page/
      '/admin'
    when /signup\s?page/
      '/users/new'
    when /information\s?page/
      information_path User.find(sessions[:if_id])
    when /member\s?page/
      '/meminf'
    when /rental\s?page/
      '/rentals/showuser'
    when /repair\s?page/
      '/repairs/new'
    when /adrep\s?page/
      '/repairs'
    

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)