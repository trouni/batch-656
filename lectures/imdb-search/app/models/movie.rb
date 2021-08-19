class Movie < ApplicationRecord
  belongs_to :director

  include PgSearch::Model
  multisearchable against: %i[title synopsis]

  # attr_reader :something
  pg_search_scope :search_by_title_and_synopsis,
                  against: %i[title synopsis],
                  using: {
                    tsearch: { prefix: true, highlight: {
                      StartSel: '<b>',
                      StopSel: '</b>'
                    } } # <-- now `superman batm` will return something!
                  }

  pg_search_scope :global_search,
                  against: %i[title synopsis],
                  associated_against: {
                    director: %i[first_name last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
