# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  expires_on :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
class Post < ApplicationRecord
  validates(:body, { presence: true })
  scope :active, -> { where('expires_on < ?', Date.current) }
  scope :expired, -> { where('expires_on > ?', Date.current) }

end
