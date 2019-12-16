class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title,   presence: true,
                        length: { minimum: 5 }
    validates :text, presence: true
end

class Article
    #...continue
    def self.get_last_articles(article_count)
        last_articles = Article.order('updated_at DESC').limit(article_count)
        last_articles
    end
end