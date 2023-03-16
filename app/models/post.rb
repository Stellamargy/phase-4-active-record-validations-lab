class Post < ApplicationRecord
    validates :title, presence:true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :not_to_allow_value
    def not_to_allow_value
        if title==="True Facts"
            errors.add(:title, "Sorry no true facts for title")
        end
    end
end
