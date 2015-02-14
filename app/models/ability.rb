class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.admin?
        can :manage, :all
    else
        can :create, [Submission, Link]
        can :create_comment, [Submission, Assignment]
        can :read, [Assignment, Course, Link, Location]
        can :read, Submission do |submission|
            submission.try(:user) == user || submission.user.id == user.id
        end
        can :update, Submission do |submission|
            submission.workflow_state != "completed" && submission.user.id == user.id
        end
        can :update, Link
        can :destroy, Submission do |submission|
            submission.workflow_state != "completed" && submission.user.id == user.id
        end
        # https://github.com/CanCanCommunity/cancancan/wiki/Nested-Resources#polymorphic-associations
        # can :destroy_comment, Submission do |submission|
        #     submission.comment.user.id
        # end
    end
    #
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
