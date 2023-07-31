require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  title = "Dice Roll"
  two_dice_six = "Roll two 6-sided dice"
  two_dice_ten = "Roll two 10-sided dice"
  one_die_twenty = "Roll one 20-sided die"
  five_dice_four = "Roll five 4-sided dice"

  "<h1>#{title}</h1>
    <ul>
      <li><a href="">#{two_dice_six}</a></li>
      <li><a href="">#{two_dice_ten}</a></li>
      <li><a href="">#{one_die_twenty}</a></li>
      <li><a href="">#{five_dice_four}</a></li>
    </ul>
  "
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d6</h1>
    <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
    <p>#{outcome}</p>"
end

get("/dice/1/20") do
  first_die = rand(1..20)

  outcome = "You rolled a #{first_die} for a total of #{first_die}."

  "<h1>1d20</h1>
    <p>#{outcome}</p>"
end

get("/dice/5/4") do 
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die

  outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, #{fifth_die} for a total of #{sum}"

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end
