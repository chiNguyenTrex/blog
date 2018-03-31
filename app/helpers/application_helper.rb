module ApplicationHelper
  def flash_type type
    case type
    when :notice then "alert-info"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    when :success then "alert-success"
    when :danger then "alert-danger"
    end
  end
end
