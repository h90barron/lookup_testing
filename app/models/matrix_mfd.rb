class MatrixMfd < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      MatrixMfd.create! row.to_hash
    end
  end
end
