# == Schema Information
#
# Table name: tweets
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Tweet < ActiveRecord::Base
  attr_accessible :content

  attr_readonly :created_at

  validates :content, presence: :true, length: { minimum: 3 }
end
