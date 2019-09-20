class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    sender.valid? && receiver.valid? ? true : false
  end 
  
  def execute_transaction
        if @status == "pending" && self.valid?
      if self.sender.balance >= @amount
        self.sender.balance -= @amount
        self.receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end 
end 


  
 
 
 


 