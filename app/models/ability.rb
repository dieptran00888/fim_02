class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, [User, Category, Artist, Album]
      can :manage, [Lyric]
    else
      can :manage, [User]
      can :manage, [Album]
      can :create, Lyric
      can :show, Artist
    end
    can :manage, Comment
  end
end
