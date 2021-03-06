# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    if user.admin?
      can :manage, :all
      cannot :manage, DashboardController
    elsif user.head?
      cannot :manage, Admin::AdminController
      can :manage, :all
    else
      cannot :manage, Admin::DashboardController
      cannot :manage, Head::DashboardController
      cannot :manage, Admin::VaccinesController
      cannot :manage, Admin::VaccinationCentersController
      cannot :manage, Admin::AllocatedVaccsController
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
