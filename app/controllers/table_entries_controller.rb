class TableEntriesController < ApplicationController
  def index
  @table_entries = TableEntry.order(:row_number)

  @alpha = (value_at(5) + value_at(20)).to_i

  denominator = value_at(7)
  @beta = denominator.zero? ? "undefined" : (value_at(15) / denominator).to_i

  @charlie = (value_at(13) * value_at(12)).to_i
end


  def calculations
    # Build a hash of {row_number => value}
    table = TableEntry.all.index_by(&:row_number)

    a5  = table[5]&.value || 0
    a7  = table[7]&.value || 0
    a12 = table[12]&.value || 0
    a13 = table[13]&.value || 0
    a15 = table[15]&.value || 0
    a20 = table[20]&.value || 0

    beta = a7.zero? ? "undefined" : (a15 / a7)

    render json: {
      alpha: a5 + a20,
      beta: beta.is_a?(Numeric) ? beta.round(2) : beta,
      charlie: a13 * a12
    }
  end

  private

  def value_at(row)
    TableEntry.find_by(row_number: row)&.value || 0
  end
end
