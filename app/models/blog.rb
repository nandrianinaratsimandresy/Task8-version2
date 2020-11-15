class Blog < ApplicationRecord
validates :tweet, presence: true, length: {minimum:1,maximum: 140}
end
