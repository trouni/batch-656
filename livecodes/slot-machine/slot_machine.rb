class SlotMachine
  SYMBOLS = %w[🍒 7️⃣ 🛎 ⭐️ 🤩].freeze

  def initialize(reels = %w[🤩 🤩 🤩])
    @reels = reels
  end

  def play
    60.times do
      shuffle_reels
      print @reels.join("\t") + "\r"
      $stdout.flush
      sleep(0.05)
    end
    sleep(0.3)
    @reels
  end

  def score
    if three_of_the_same?
      unique_symbol = @reels.first
      symbol_value(unique_symbol) * 10
    elsif two_of_the_same_plus_joker?
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
    @reels.uniq.length == 1
  end

  def two_of_the_same_plus_joker?
    @reels.uniq.length == 2 && @reels.include?('🤩')
  end
end
