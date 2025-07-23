class Tsueet < ApplicationRecord
  validates :content, presence: true

  after_create_commit -> { broadcast_refresh_later_to("tsueets") }
  after_update_commit -> { broadcast_refresh_later; broadcast_refresh_later_to("tsueets") }
  after_destroy_commit -> { broadcast_refresh; broadcast_refresh_later_to("tsueets") }
end
