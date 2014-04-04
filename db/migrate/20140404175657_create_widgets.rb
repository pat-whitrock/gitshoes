class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string  :color
      t.string  :font_color
      t.string  :background_color
      t.string  :tab_font
      t.integer :tab_font_size
      t.string  :tab_text
      t.integer :tab_edge_radius
      t.string  :field_font
      t.integer :field_font_size
      t.string  :title_field_text
      t.string  :description_field_text
      t.string  :button_font
      t.integer :button_font_size
      t.string  :button_text
      t.string  :orientation
      t.integer :offset

      t.timestamps
    end
  end
end
