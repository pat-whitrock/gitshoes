namespace :widgets do
	desc "Provide default widgets to repos without widgets"
	task :add_defaults => :environment do
		Repo.all.each do |repo|
			widget = Widget.create_default
			repo.widget = widget
		end
	end
end