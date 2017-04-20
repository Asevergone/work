class User < ApplicationRecord
validates_uniqueness_of  :name, presence: true,
                    length: { minimum: 1 }
validates :password, presence: true,
                    length: { minimum: 6 }
end
