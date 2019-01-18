class VendingMachine
  attr_accessor :amount_cents, :snack_price_cents, :snacks
  # TODO: add relevant getter/setter to this class to make the scenarios work properly.

  def initialize(snack_price_cents, snacks)
    @amount_cents = 0
    @snacks = snacks
    @snack_price_cents = snack_price_cents
  end

  def insert_coin(value_cents)
    # TODO: what happens to @snacks, @amount_cents and @snack_price_cents
    # when the user inserts a coin?
    @amount_cents += value_cents
  end

  def buy_snack
    # TODO: what happens to @snacks, @amount_cents and @snack_price_cents
    # when the user pushes a button to buy a Snack?
    if @amount_cents > snack_price_cents
      @amount_cents = amount_cents - snack_price_cents
      @snacks = snacks - 1
    end
  end
end
