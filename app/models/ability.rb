class Ability
  include CanCan::Ability

  def initialize(user)

    #Todos los permisos CRUD
    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :create, :read, :destroy, :to => :crd 
    alias_action :create, :read, :to => :cr
    alias_action :update, :destroy, :to => :ud

    #Cuando el Usuario No esta registrado
    user ||= User.new  

    if (user.has_role? :usuario)  
        can :crud , User , :id => user.id
        
        can :ud, Favor , :user_id => user.id
        can :cr, Favor
        
        can :read , Ranking
        cannot :create, Ranking
        cannot :update, Ranking
        cannot :destroy, Ranking
    end
    if user.has_role? :admin
        can :crud, User
        #can :crud, CouchType
        can :crud, Favor
        #can :crud, Reservation
        can :crud, Ranking
    else 
        #can :read, Couch
    end




    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
