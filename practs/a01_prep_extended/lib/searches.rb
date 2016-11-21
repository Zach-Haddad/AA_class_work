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
