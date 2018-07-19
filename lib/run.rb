require 'pry'
require_relative 'transfer'
require_relative 'bank_account'

cindy = BankAccount.new("Cindy", 50000)
alex = BankAccount.new("Alex")
avi = BankAccount.new("Avi", -10)

pry.Start
