module RolesHelper

  def require_owner_or_admin!
    require_owner!
  rescue Acl9::AccessDenied => e
    require_admin!
  end

  def require_owner!
    authenticate_user!
    current_user.has_role_for?(resource) or raise Acl9::AccessDenied
  end

  def require_admin!
    authenticate_user!
    if current_user.has_role?(:admin)
      require_two_factor!
      UserAction.admin_action.create(data: params)
      return true
    else
      raise Acl9::AccessDenied
    end
  end

  def require_two_factor!
    warden.authenticate!(scope: :two_factor)
  end

  # helper_method(:require_owner_or_admin!, :require_owner!, :require_admin!, :require_two_factor!)
end