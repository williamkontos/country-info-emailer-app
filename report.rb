require 'prawn'
require 'pry'
 
class Report
  def initialize(country)
    @country = country
  end
 
  def run
    Prawn::Document.generate("country_report.pdf") do |pdf|
      pdf.text @country.name
      pdf.move_down 20
      pdf.text "Currency: #{@country.currency.name}"
      if @country.states.any?
        pdf.move_down 20
        pdf.text "States:"
        pdf.move_down 20
        @country.states.each do |code, state|
          pdf.text state.name
        end
      end
    end
  end
end