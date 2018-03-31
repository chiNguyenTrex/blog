module ApplicationHelper
  def bootstrap_flash_type type
    case type
    when :notice then "info"
    when :error then "danger"
    when :alert then "warning"
    when :success then "success"
    when :danger then "danger"
    end
  end

  def toastr_flash_type type
    case type
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    when :success then "success"
    when :danger then "error"
    end
  end
end
