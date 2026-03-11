class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def tags=(tags)
    tags = tags.join(",").map(&:strip) if tags.is_a?(String)
    super(tags)
  end

  def self.find_by_tags(tags)
    # Convert the array of tags into a format suitable for the PostgreSQL array query
    array_of_tags = PG::TextEncoder::Array.new.encode(tags)

    # Use the `&&` operator to find posts that have any of the specified tags
    where("tags && ?", array_of_tags)
  end
end
