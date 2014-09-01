class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :caption, type: String
  rolify
  resourcify
  validates_length_of :title, :maximum => 30
  validates_length_of :caption, :maximum => 100
  validates_presence_of :caption
  validates_presence_of :title
  belongs_to :user
  has_many :comments

end
