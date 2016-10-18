# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, :text, presence: true
end
