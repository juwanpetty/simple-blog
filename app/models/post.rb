class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :content, presence: true

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
    extend FriendlyId
    friendly_id :title, use: :slugged
end
