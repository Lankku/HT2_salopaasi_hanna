class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  attr_accessible :body
end
