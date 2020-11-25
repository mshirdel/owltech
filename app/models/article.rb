class Article < ApplicationRecord
  belongs_to :source
  belongs_to :user

  validates :url , uniqueness: true
  validates :url , :title, :intro_text, :img_url, presence: true
end
