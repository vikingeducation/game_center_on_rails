class Card < ApplicationRecord

  def self.build_deck
    all.shuffle
  end
end
