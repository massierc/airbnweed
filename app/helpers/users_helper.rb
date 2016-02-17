module UsersHelper
  def truncate(s, max = 40, elided = ' ...')
    s.match(/(.{1,#{max}})(?:\s|\z)/)[1].tap do |res|
      res << elided unless res.length == s.length
    end
  end

  def average_score(user)
    total = 0
    user.deals.each do |deal|
      total += deal.rating unless deal.rating.nil?
    end
    return total / (user.deals.length)
  end
end
