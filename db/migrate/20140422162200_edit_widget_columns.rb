class EditWidgetColumns < ActiveRecord::Migration
  def change
  	change_column :widgets, :tab_font_size, :string
  	change_column :widgets, :tab_width, :string
  	change_column :widgets, :tab_height, :string
  	change_column :widgets, :tab_edge_radius, :string
  	change_column :widgets, :field_font_size, :string
  	change_column :widgets, :button_font_size, :string
  	change_column :widgets, :form_width, :string
  	change_column :widgets, :form_border_thickness, :string
  	change_column :widgets, :form_border_color, :string
  	change_column :widgets, :form_border_radius, :string
  	change_column :widgets, :offset, :string
  	change_column :widgets, :tab_display, :string
  end
end
