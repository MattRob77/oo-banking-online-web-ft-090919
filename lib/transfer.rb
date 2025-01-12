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
      if valid? && @status == "pending" && sender.balance > amount
        sender.balance -= amount 
        receiver.balance += amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
    
    def reverse_transfer
      if valid? && @status == "complete" && receiver.balance > amount
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

end

  
 
 
 


 