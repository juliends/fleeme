class Service < ActiveRecord::Base

  has_attachments :photos, maximum: 2, accept: [:png]


end
