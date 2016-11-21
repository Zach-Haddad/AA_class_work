class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    self.each {|k,v| prc.call(k,v)}
  end
  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    self_dup = dup

    hash2.each {|k,v| self_dup[k] = v}
    self_dup
  end

end
