# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :text
#  lat         :decimal(, )
#  long        :decimal(, )
#  status      :integer
#  time        :time
#  votes       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Event < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true

  enum status: [ :unapproved, :approved ]
end
