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
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
