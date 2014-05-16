require 'colorize'

class Application


  def initialize
    main_menu
  end

  def navigate_to(what)
    what.new.display
    main_menu
  end

  def all_processes
    ps aux | less
  end

  def load_average
    uptime
  end

  def resources_usage
    free -m
  end

  def main_menu
      puts "What would you like to do?".colorize(:color => :blue)
      puts "1 If you want to know how many processes are running.".colorize(:red).on_blue.underline
      puts "2 To see what the load average is.".colorize(:green ).colorize( :background => :yellow)
      puts "3 For various resource usage".colorize(:light_blue ).colorize( :background => :red)
    case gets.strip
    when "1"
      all_processes
    when "2"
      navigate_to Two
    when "3"
      navigate_to Three
    else
      puts "Choose either 1 or 2 or 3."
      main_menu
    end
  end
end




Application.new


