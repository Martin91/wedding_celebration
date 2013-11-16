class Blessing < ActiveRecord::Base
  attr_accessible :content, :editor

  validates :editor, :content, presence: true
end
