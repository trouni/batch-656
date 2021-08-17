class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope => the Restaurant class, which was passed in `policy_scope`
      scope.all

      # For example, Post scope for a blog:
      # scope.where(published: true)
    end
  end

  # def new?
  #   create?
  # end

  def create?
    true
  end

  def show?
    true
  end

  ## inherits the same method from the ApplicationPolicy
  # def edit?
  #   update?
  # end

  def update?
    user_is_owner? || user_is_admin?
  end

  def destroy?
    user_is_admin?
  end

  private

  def user_is_owner?
    # user => same as current_user, but in Pundit
    # record => the restaurant that was passed in `authorize @restaurant`
    user == record.user
  end

  def user_is_admin?
    user.admin?
  end
end
