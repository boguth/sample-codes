require 'csv'
require 'date'

class Doer
  def parser(file)
    @file = file
    @people = []
    CSV.foreach(@file, :headers => true) do |row|
      @people << row
    end
    @people
  end

  def adder(file, data)
    CSV.open(file, "a+") do |csv|
      csv << data
    end
  end
end

parser = Doer.new
parser.parser('people.csv')
parser.adder('people.csv', ["1", "lane", "marigold", "bob@org.email", "23452563", "12453212435"])
