class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer :repo_id
      t.string  :position
      t.string  :edge
      t.string  :color
      t.string  :tab_font_color
      t.string  :tab_background_color
      t.string  :body_font_color
      t.string  :body_font_size
      t.string  :body_font
      t.string  :tab_font
      t.string  :tab_font_size
      t.string  :tab_text_align
      t.string  :tab_text
      t.string  :tab_width
      t.string  :tab_height
      t.string  :tab_margin
      t.string  :tab_padding
      t.string  :tab_line_height
      t.string  :tab_edge_radius
      t.string  :tab_cursor
      t.string  :tab_display
      t.string  :field_font
      t.string  :field_font_size
      t.string  :title_field_text
      t.string  :description_field_text
      t.string  :button_font
      t.string  :button_font_size
      t.string  :button_text
      t.string  :form_background_color
      t.string  :form_width
      t.string  :form_border_thickness
      t.string  :form_border_type
      t.string  :form_border_color
      t.string  :form_border_radius
      t.string  :orientation
      t.string  :offset

      t.timestamps
    end
  end
end
