class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_five_posts
        self.posts.last(5)
    end

    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def average_blogger_age
        bloggers = self.bloggers.uniq
        ages = bloggers.map {|blogger| blogger.age}
        average = ages.inject{ |sum, el| sum + el }.to_f / ages.size
        average
    end
    

end
