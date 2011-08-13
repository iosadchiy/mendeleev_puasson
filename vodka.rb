class Vessel
  INF = 0.32/0.0
  attr_accessor :linked
  attr_reader :name
  attr_reader :volume
  attr_accessor :w
  attr_accessor :s

  def initialize(name, volume, water, spirits)
    @name = name
    @volume = volume.to_f
    @w = water.to_f
    @s = spirits.to_f
    @linked = []
  end

  def total
    @w + @s
  end

  def vodka?
    total.round(4) == 1 and (@s/@w).round(4) == (2.0/3.0).round(4)
  end

  def pourto(vessel)
    vol = vol_to_pour(vessel)
    w = self.w.infinite? ? vol : vol * self.w / self.total
    s = self.s.infinite? ? vol : vol * self.s / self.total
    raise "oops: #{w}+#{s} != #{vol}" unless (w+s).round(4) == vol.round(4)
    self.w -= w; vessel.w += w
    self.s -= s; vessel.s += s
  end

  def vol_to_pour(vessel)
    [total, vessel.volume - vessel.total].min
  end

  def inspect
    "#{name}: #{s}/#{w}"
  end
end


class TheCat
  MAX_STEPS = 6

  def initialize(realm)
    @realm = realm

    please(realm.dup)
  end

  def please(realm, actions = [])
    return if actions.size >= MAX_STEPS

    realm.each_index do |nb|
      realm[nb].linked.each_index do |nl|
        cur_realm = Marshal.load(Marshal.dump(realm))
        cur_actions = actions.dup
        b = cur_realm[nb]
        ln = b.linked[nl]

        if b != ln and b.vol_to_pour(ln) > 0
          b.pourto(ln)
          cur_actions << {b.name => ln.name}
          puts cur_actions.inspect if b.vodka? or ln.vodka?

          please(cur_realm, cur_actions)
        end
      end
    end
  end
end



b3 = Vessel.new(:b3, 3, 0, 0)
b5 = Vessel.new(:b5, 5, 0, 0)
w = Vessel.new(:water, Vessel::INF, Vessel::INF, 0)
s = Vessel.new(:spirits, Vessel::INF, 0, Vessel::INF)
p = Vessel.new(:wcpan, Vessel::INF, 0, 0)

b3.linked = [b5, p]
b5.linked = [b3, p]
w.linked = [b3, b5]
s.linked = [b3, b5]

cat = TheCat.new([b3,b5,w,s,p])
