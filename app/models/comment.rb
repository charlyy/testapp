class Comment
	include Mongoid::Document
	include Mongoid::Timestamps
	field :text, type: String
	belongs_to :user
	belongs_to :post
	validates_presence_of :text
	validates_length_of :text, :maximum => 100
end
