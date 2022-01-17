class Article < ApplicationRecord
    belongs_to(:pub, { :required => true, :class_name => "Publication", :foreign_key => "pub_id", :counter_cache => true })
    belongs_to(:writer, { :required => true, :class_name => "Writer", :foreign_key => "author_id", :counter_cache => true })
end
