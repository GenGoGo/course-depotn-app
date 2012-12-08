class Cart < ActiveRecord::Base
	has_many :line_item
end
