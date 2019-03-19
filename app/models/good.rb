class Good < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user

  def as_json(options={})
    {
      id:               id,
      description:      description,
      more_information: more_information,
      location:         url_for(self),
      owner_pic:        user.profile&.pic&.attached? ? url_for(user.profile.pic) : 'https://randomuser.me/api/portraits/med/men/1.jpg'
    }
  end
end
