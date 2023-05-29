require 'csv'
require 'faker'

task csv_thread: [:environment] do
  @table = []
  @table = CSV.parse(File.read("hospitals.csv"), headers:true)
  
  FILE_LINES_COUNT = @table.size
 

  def setup(thread_count)
    puts "----- count of threads = #{thread_count}"
    threads = []
    lines_per_thread = FILE_LINES_COUNT / thread_count
    puts "----- lines per thread = #{lines_per_thread}"

    @table.to_a.each_slice(lines_per_thread) do | slice |
      threads << Thread.new do
        # slice.each do | row |
        #   h_name = row[0];
        #   h_city = row[1];
        #   h_type = row[3];
        #   h_rate = row[5];
        #   h_year = Faker::Date.between(from: '2000-01-01', to: '2010-12-12');
          
        #   hospital = Hospital.new(name: h_name, year: h_year, location: h_city, city: h_city, rating_mortality: h_rate, category: h_type)
        #   hospital.save
        # end
      end
    end

    threads.each(&:join)
  end

  setup(10)
end