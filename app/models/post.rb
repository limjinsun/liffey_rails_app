class Post < ApplicationRecord
  belongs_to :user, optional: true
  paginates_per 25
end
