class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, [User, Category, Artist, Album]
      can :manage, [Lyric]
    else
      can :manage, [Album]
      can :create, Lyric
    end
    can :manage, Comment
  end
end
