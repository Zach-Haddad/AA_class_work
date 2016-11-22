def dfs(target_value) #recursion
  return self if self.value == target_value

  self.children.each do |child|
    current = child.dfs(target_value)
    return current if current
  end

  nil
end

def bfs(target_value)
  queue = [self]

  until queue.empty?
    current = queue.shift
    return current if current.value == target_value

    current.children.each do |child|
      queue << child
    end
  end

  nil
end

def my_bsearch(target, &prc)
  return nil if size == 0
  prc ||= proc {|a,b| a <=> b}
  #use dup and take/drop when you don't want to modify original array!!

  midpoint = length/2
  case prc.call(target, self[midpoint])
  when -1
    self.dup.take(midpoint).my_bsearch(target, &prc)
  when 0
    return midpoint
  when 1
    res = self.dup.drop(midpoint + 1).my_bsearch(target, &prc)
    res.nil? ? nil : midpoint + 1 + res
    #need mid + 1 + res; 1 accounts for index offset, res is new midpt, mid is old midpt
  end
end
