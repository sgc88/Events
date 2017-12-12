class Event < ApplicationRecord
<<<<<<< HEAD
=======
  has_many :users
>>>>>>> 20c022cf3aef3d78ea4459a050959cd4ac79d952
  def self.search(search)
    if search
      # self.where(:conditions => ['caller_name LIKE ?', "%#{search}%"])
      self.where('event LIKE ? OR host LIKE ? OR activities LIKE ? OR address LIKE ? OR zipcode LIKE ? ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.order('id DESC')
    end
  end

end
