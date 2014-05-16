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
    `ps aux`
  end

  def load_average
    `uptime`
  end

  def resources_usage
    `free -m`
  end

  def main_menu
    quit = false
    until quit == true
      puts "What would you like to do?".colorize(:color => :blue)
      puts "1: If you want to know how many processes are running.".colorize(:red).on_blue.underline
      puts "2: To see what the load average is.".colorize(:green ).colorize( :background => :yellow)
      puts "3: For various resource usage".colorize(:light_blue ).colorize( :background => :red)
      puts "q: Quit"
      case gets.strip
      when "1"
        puts all_processes
      when "2"
        puts load_average
      when "3"
        puts resources_usage
      when 'q'
        quit = true
      else
        puts "Choose either 1 or 2 or 3."
      end
    end

    puts 'buh-bye'
  end
end

Application.new
