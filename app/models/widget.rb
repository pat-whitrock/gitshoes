class Widget < ActiveRecord::Base
	belongs_to :repo

	def self.create_default
		self.new(
			position: "fixed",
			edge: "bottom",
			color: "#357ebd",
			tab_font_color: "#ffffff",
			tab_background_color: "#357ebd",
			body_font_color: "#333333",
			body_font_size: "14px",
			body_font: "'Open Sans', sans-serif",
			tab_font: "sans-serif",
			tab_font_size: "18px",
			tab_text_align: "center",
			tab_text: "Feedback",
			tab_width: "100px",
			tab_height: "35px",
			tab_line_height: "30px",
			tab_margin: "0px",
			tab_padding: "3px 10px 3px 10px",
			tab_edge_radius: "5px",
			tab_cursor: "pointer",
			tab_display: "inline-block",
			field_font: "sans-serif",
			field_font_size: "14px",
			title_field_text: "Title",
			description_field_text: "Description",
			button_font: "sans-serif",
			button_font_size: "18px",
			button_text: "Add Issue",
			form_background_color: "#ffffff",
			form_width: "300px",
			form_border_thickness: "1px",
			form_border_type: "solid",
			form_border_color: "#9a9a9a",
			form_border_radius: "5px",
			orientation: "right",
			offset: "30px"
		)
	end

end
