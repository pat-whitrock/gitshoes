class AddColumnsToWidgets < ActiveRecord::Migration
  def change
  	add_column :widgets, :repo_id, :integer
  	add_column :widgets, :position, :string
  	add_column :widgets, :edge, :string
  	add_column :widgets, :tab_background_color, :string
  	add_column :widgets, :body_font_size, :string
  	add_column :widgets, :body_font, :string
  	add_column :widgets, :tab_text_align, :string
  	add_column :widgets, :tab_margin, :string
  	add_column :widgets, :tab_padding, :string
  	add_column :widgets, :tab_line_height, :string
  	add_column :widgets, :tab_cursor, :string
  	add_column :widgets, :tab_display, :string
  	add_column :widgets, :button_success_text, :string
  	add_column :widgets, :button_color, :string
  	add_column :widgets, :button_background_color, :string
  	add_column :widgets, :form_background_color, :string
  end
end
