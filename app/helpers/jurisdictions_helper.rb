module JurisdictionsHelper
  def key_display(str)
    (str.gsub(/_/, ' ').split(" ").map { |w| w.capitalize }.join " ")
  end
end

