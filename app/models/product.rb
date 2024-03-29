class Product < ActiveRecord::Base
	default_scope :order => 'price'
	scope :cheap, where('price < 600')
	validates :title, :description, :image_url, :price, :presence => true
	validates :title, :uniqueness => true
	validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
	validates :image_url, :format => { :with => %r{\.(gif|jpg|png)$}i, :message => "Must be JPG, PNG or GIF" }
	
	has_many :line_items
	before_destroy :ensure_not_referenced_any_line_item
	
	def ensure_not_referenced_any_line_item
		if line_items.empty?
			true
		else
			errors.add(:base, 'There ate line itms')
			false
		end
	end
end