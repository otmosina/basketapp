class Corf < ActiveRecord::Base
  attr_accessible :user_id, :good_id
  belongs_to :user
  belongs_to :good
end	