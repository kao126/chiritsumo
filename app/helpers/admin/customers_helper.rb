module Admin::CustomersHelper
  def show_content(value)
    if value.present?
      return value
    else
      return "未記入"
    end
  end
end
