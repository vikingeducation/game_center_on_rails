# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# GENERATE CARDS
face_cards = %w(Jack Queen King)
suits = %w(Hearts Diamonds Clubs Spades)
numbers = (2..10).to_a.unshift('Ace').push(face_cards).flatten
deck = numbers.product(suits)

deck.each do |num, suit|
  Card.find_or_create_by(name: "#{num} of #{suit}") do |card|
    card.suit = suit
    card.number = num

    if num.class == Integer
      card.value = num
    elsif num == 'Ace'
      card.value = 1
    else
      card.value = 10
    end

  end #Card
end #deck

