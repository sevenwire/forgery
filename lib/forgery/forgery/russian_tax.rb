# Generates various special numbers for Russian taxation system
# They have numbers for identification, for banks, for companies and entrepreneurs
class Forgery::RussianTax < Forgery

  TYPES = Forgery::Extend([:person, :legal])

  #bank identification
  def self.bik
    "04#{5.times.map { rand(9) + 1 }.join}#{rand(50) + 50}"
  end

  #bank account format pretty simple
  def self.account_number
    20.times.map { rand(9) + 1 }.join
  end

  #taxation id
  def self.inn(options = {})
    type = TYPES.include?(options[:type]) ? options[:type] : TYPES.random
    send [type, :inn].join('_')
  end

  #government registration id
  def self.ogrn(options = {})
    type = TYPES.include?(options[:type]) ? options[:type] : TYPES.random
    send [type, :ogrn].join('_')
  end

  private
  def self.person_inn
    mask = [[7, 2, 4, 10, 3, 5, 9, 4, 6, 8], [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]]
    inn = 12.times.map { rand(9) + 1 }.join
    inn[10] = ((0..(inn.length-3)).inject(0) {|crc, i| crc + inn[i].to_i*mask[0][i].to_i} % 11 % 10).to_s
    inn[11] = ((0..(inn.length-2)).inject(0) {|crc, i| crc + inn[i].to_i*mask[1][i].to_i} % 11 % 10).to_s
    inn
  end

  def self.legal_inn
    mask = [2, 4, 10, 3, 5, 9, 4, 6, 8]
    inn =  10.times.map { rand(9) + 1 }.join
    inn[9] = ((0..(inn.length-2)).inject(0) {|crc, i| crc + inn[i].to_i*mask[i].to_i} % 11 % 10).to_s
    inn
  end

  def self.person_ogrn
    ogrn = 14.times.map { rand(9) + 1 }.join
    ogrn += (ogrn.to_i%13%10).to_s
    ogrn
  end

  def self.legal_ogrn
    ogrn = 12.times.map { rand(9) + 1 }.join
    ogrn += (ogrn.to_i%11%10).to_s
    ogrn
  end

end
