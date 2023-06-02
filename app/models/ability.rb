class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can %i[read create], Category
    can %i[index create], Expense
  end
end