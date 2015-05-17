module ApplicationHelper
  def to_bdt(amount)
    number_to_currency(amount, :unit => ' tk', :separator => '.', :delimiter => ',', format: '%n%u')
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end
end
