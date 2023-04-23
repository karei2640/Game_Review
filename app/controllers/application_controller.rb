class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Customer)
      customer_path(current_customer)
    else
      super
    end
  end
end
