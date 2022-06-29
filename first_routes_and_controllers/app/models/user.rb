# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username)
#
class User < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :works_of_art,
        primary_key: :id, 
        foreign_key: :artist_id, 
        class_name: :Artwork

    has_many :shares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :shares,
        source: :artwork
end
