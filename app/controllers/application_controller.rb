class ApplicationController < ActionController::Base

  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "No tiene permisos para acceder a esta pagina."
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
