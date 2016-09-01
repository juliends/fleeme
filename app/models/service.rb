class Service < ActiveRecord::Base

  has_many :unsubs
  validates :name, :uniqueness => true

  has_attachments :photos, maximum: 2, accept: [:png]

end
