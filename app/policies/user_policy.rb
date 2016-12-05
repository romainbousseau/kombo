class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

  end

  def show?
    true
  end

  def dashboard?
    true
  end

  def add_skill?
    true
  end

  def update?
    true
  end
end
