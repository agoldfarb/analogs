class Review < ActiveRecord::Base
  belongs_to :vinyl
  belongs_to :user
end
