#create a user

%w{emacs emacs-nox ldof strace tmux htop}. each do |pkg|
  package pkg do
    action :install
  end
end

user 'unicorn' do
  shell '/codecraft-lab/lib/menu.rb'
  action :crate
end

rbenv_global '2.0.0.-p451' do
  user 'unicorn'
end

%w{bundler rake}.each do |gem|
  rbenv_gem gem do
    rbenv_version '2.0.0-p451'
  end
end