class Tsueet < ApplicationRecord
  broadcasts_refreshes

  validates :content, presence: true
end
