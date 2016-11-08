class CalculationsController < ApplicationController
  def instructions
    render("instructions.html.erb")
  end

  def square
    @number=params[:number]
  end

  def square_root
    @number=params[:number].to_f
    @square_root=@number ** 0.5
    return @square_root
  end

  def random
    @min=params[:min].to_i
    @max=params[:max].to_i
    @random_number=rand(@min..@max).to_i
    return @random_number
  end

  def payment
    @interest=params[:interest].to_f / 100
    @time_period=params[:time_period].to_i
    @time_period_month=@time_period*12
    @principal=params[:principal].to_i
    @effective_interest=@interest/100/12
    @discount = 1/(1-(1+@effective_interest)**(-1*@time_period_month))
    @monthly_payment=(@principal*(@effective_interest*@discount)).round(2)
    return @monthly_payment
  end
end
