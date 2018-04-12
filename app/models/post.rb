class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :content, presence: true

    extend FriendlyId
    friendly_id :title, use: :slugged
end
