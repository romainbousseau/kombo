class WorkSessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

  end
  def create?
    true
  end

  def update?
    true
  end

  def show
    true
  end
end
