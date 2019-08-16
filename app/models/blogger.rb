class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts


    validates :name, { uniqueness: true }
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }
    
   

    def top_5_destinations
        
        array = self.destinations.sort_by do |destination|
            destination.posts.length
        end

        array.last(5)
    end


    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end
end


