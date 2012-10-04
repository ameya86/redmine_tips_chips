require 'tips_chips_application_helper_patch'

Redmine::Plugin.register :redmine_tips_chips do
  name 'Tips Chips plugin'
  author 'OZAWA Yasuhiro'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/ameya86/redmine_tips_chips'
  author_url 'https://github.com/ameya86'

  menu :admin_menu, :tips_chips, {:controller => 'tips_chips', :action => 'index'}, :caption => :label_tips_chips, :html => {:class => 'icon icon-fav'}
end
