class Event < ApplicationRecord
  acts_as_votable
  belongs_to :user
  def self.search(search)
    if search
      self.where('event LIKE ? OR host LIKE ? OR activities LIKE ? OR address LIKE ? OR zipcode LIKE ? ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.order('id DESC')
    end
  end

end
