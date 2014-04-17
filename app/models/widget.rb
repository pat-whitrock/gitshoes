class Widget < ActiveRecord::Base
	belongs_to :repo

	# def self.create_default
	# 	self.new(
	# 		color: "#357ebd",
	# 		tab_font_color: "#ffffff",
	# 		body_font_color: "#333333",
	# 		background_color: "#ffffff",
	# 		tab_font: "sans-serif",
	# 		tab_font_size: 18,
	# 		tab_text: "Feedback",
	# 		tab_width: 100,
	# 		tab_height: 35,
	# 		tab_edge_radius: 5,
	# 		field_font: "sans-serif",
	# 		field_font_size: 14,
	# 		title_field_text: "Title",
	# 		description_field_text: "Description",
	# 		button_font: "sans-serif",
	# 		button_font_size: 18,
	# 		button_text: "Add Issue",
	# 		form_width: 300,
	# 		form_border_thickness: 1,
	# 		form_border_type: "solid",
	# 		form_border_color: "9a9a9a",
	# 		form_border_radius: 5,
	# 		orientation: "right",
	# 		offset: 30
	# 	)
	# end

end
