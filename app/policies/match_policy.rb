class MatchPolicy < ApplicationPolicy
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

  def validate?
    true
  end

  def decline?
    true
  end

  def done?
    true
  end
end
