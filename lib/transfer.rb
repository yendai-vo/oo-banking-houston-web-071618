class Transfer

  attr_reader :sender, :receiver, :amount, :status

  @@transactions = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver= receiver
    @status = "pending"
    @amount = amount

  end

  def valid?
    @sender.valid? && @receiver.valid?

  end

  def execute_transaction
    if self.sender.valid? && self.sender.balance > @amount
      if !@@transactions.include?(self)
        @@transactions << self
        self.sender.balance -= @amount
        self.receiver.balance += @amount
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@transactions.include?(self)
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
