module ApplicationHelper
  def pretty_date(date = nil)
    date = Time.now if date.nil?
    date.strftime('%m/%d/%Y')
  end
end
