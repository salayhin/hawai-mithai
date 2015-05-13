module ApplicationHelper
  def to_bdt(amount)
    number_to_currency(amount, :unit => ' tk', :separator => '.', :delimiter => ',', format: '%n%u')
  end
end
