class Publication < ApplicationRecord
    has_many(:articles, { :class_name => "Article", :foreign_key => "pub_id", :dependent => :destroy })
end
