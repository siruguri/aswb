class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    # Not logged in = can only see the tasks index page.
    if !user.id
#      can :index, Jurisdiction
    else
      if user.admin?
        can :manage, :all
        can :dashboard
      else
        can [:edit, :read, :update, :destroy, :suggest_draft], Jurisdiction, :owner_id => user.id
        can [:read], Change, jurisdiction: {owner_id: user.id}
        can [:read], LicensedPractice, jurisdiction: {owner_id: user.id}
      end
    end

    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
