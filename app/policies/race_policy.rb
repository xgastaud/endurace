class RacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def like?
    true
  end
end
