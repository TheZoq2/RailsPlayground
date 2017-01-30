class WelcomeController < ApplicationController
  def index
  end

  def create
      @counter = Counter.create(counter: 0)
      @counter.save
  end

  def list
      @counters = Counter.all

      @amount = @counters.length
  end

  def increment
      id = params[:id]

      @counter = Counter.find(id)

      @counter.counter += 1

      @counter.save
  end
end
