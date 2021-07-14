class SlotMachine
  SYMBOLS = %w[🍒 7️⃣ 🛎 ⭐️ 🤩].freeze

  def initialize(reels = %w[🤩 🤩 🤩])
    @reels = reels
  end

  def play
    60.times do
      shuffle_reels
      print @reels.join("\t") + "\r"
      $stdout.flush # this with '\r' resets the terminal output to create the animation
      sleep(0.05) # we wait a little bit for the animation
    end
    sleep(0.3) # we wait a little bit for suspense
    @reels
  end

  def score
    if three_of_the_same?
      # We can select any of the reels since they are identical
      unique_symbol = @reels.first
      symbol_value(unique_symbol) * 10
    elsif two_of_the_same_plus_joker?
      # We sort the reels to make sure the middle reel is the doubled symbol
      double_symbol = @reels.sort[1]
      symbol_value(double_symbol) * 5
    else
      0
    end
  end

  private

  def shuffle_reels
    # @reels = []
    # 3.times { @reels << SYMBOLS.sample }
    @reels = @reels.map { SYMBOLS.sample }
  end

  def symbol_value(symbol)
    SYMBOLS.index(symbol) + 1
  end

  def three_of_the_same?
    # %w[🛎 🛎 🛎].uniq => ['🛎']
    @reels.uniq.length == 1
  end

  def two_of_the_same_plus_joker?
    # %w[🛎 🤩 🛎].uniq => ['🛎', '🤩']
    @reels.uniq.length == 2 && @reels.include?('🤩')
  end
end
