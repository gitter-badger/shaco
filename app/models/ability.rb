class Ability
  include CanCan::Ability
  def initialize(current_user)
    @user = current_user || User.new
    if @user.admin?
      can(:manage, :all)
    else
      can(:read, :all)
      can(:manage, [Article, Comment], user: @user)
      can(:manage, User, id: @user.id)
    end
  end
end
