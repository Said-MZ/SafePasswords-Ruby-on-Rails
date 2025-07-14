class Entry < ApplicationRecord
  belongs_to :user

  validates :name, :username, :password, presence: true
  validate :url_must_be_valid

  encrypts :username, deterministic: true
  encrypts :password


  private
  def url_must_be_valid
    return if url.blank?

    unless url.start_with?("http://", "https://")
      errors.add(:url, "must be a valid URL starting with http:// or https://")
    end
  end
end
