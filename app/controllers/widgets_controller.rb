class WidgetsController < ApplicationController
	protect_from_forgery :except => [:edit]

	def edit
		@repo = Repo.find(params[:id])
		@widget = @repo.widget
		respond_to do |format|
			format.html
			format.js
    end
	end

	def update
		@widget = Widget.find(params[:id])
		if @widget.update_attributes(widget_params)
 			redirect_to repos_path
 		else
 			render :edit
 		end
	end

	private
	def widget_params
			params.require(:widget).permit(:position, :edge, :color,
				:tab_font_color, :tab_background_color, :button_color,
				:button_background_color, :body_font_color,
				:body_font_size, :body_font, :tab_font, :tab_font_size,
				:tab_text_align, :tab_text, :tab_width, :tab_height,
				:tab_margin, :tab_padding, :tab_line_height, :tab_edge_radius,
				:tab_cursor, :tab_display, :field_font, :field_font_size,
				:title_field_text, :description_field_text, :button_font,
				:button_font_size, :button_text, :button_success_text,
				:form_background_color, :form_width, :form_border_thickness,
				:form_border_type, :form_border_color, :form_border_radius,
				:orientation, :offset)
		end

end