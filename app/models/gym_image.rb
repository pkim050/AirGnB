class GymImage < ApplicationRecord
    belongs_to :gym

    has_attached_file :picture, styles: {
        small: "150x150#",
        medium: "200x200>",
        large: "300x300>"
    }

    validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/
end
