class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name ,{
        presence:true,
        uniqueness:true
    }
    validates :age, {
        presence:true,
        numericality: { 
            only_integer: true,
            greater_than: 0
        }
    }
    validates :bio, {
        length: { minimum: 30 }
    }
end
