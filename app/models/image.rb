class Image < ActiveRecord::Base
	after_save :set_orientation
	has_attached_file :data, :styles => { :large => "800x", :thumb => "100x100#"}
	validates_attachment_content_type :data
	private
	def set_orientation
		self.orientation=Paperlcip::Geometry.from_file(self.data.to_file).horizontal? ? 'horizontal' : 'vertical'
	end
end