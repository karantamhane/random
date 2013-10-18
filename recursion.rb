def summation(nlist)
  if nlist == []
    return 0
  else
    return nlist[0] + summation(nlist.slice(1,nlist.length))
  end
end

def index(num, nlist)
  if nlist == []
    return -1
  elsif nlist[-1] == num
    return nlist.length-1
  else
    return index(num, nlist.slice(0, nlist.length-1))
  end
end

def binary_tree_sum(root)
  if root == nil
    return 0
  else
    return root.value + binary_tree_sum(root.left) + binary_tree_sum(root.right)
  end
end

def count_change(amount, coins)
  coin_hash = {1 => 1, 2 => 5, 3 => 10, 4 => 25, 5 => 50}
  if amount < 0 or coins == 0
    return 0
  elsif amount == 0
    return 1
  else
    return count_change(amount, coins-1) + count_change(amount-coin_hash[coins], coins)
  end
end

def power_set(list)
  if list.length <= 0
    return [[]]
  else
    return power_set(list.slice(1,list.length)) + power_set(list.slice(1,list.length)).map {|set| set + [list[0]]}
  end
end

#power_set_of_list = power_set(list)

  
def perms(comb)
  perms_list = []
  if comb.length == 1
    return [comb]
  else
    for i in 0...comb.length
      perms_list += perms(comb.slice(0, i) + comb.slice(i+1, comb.length)).map{|set| comb[i] + set}
    end
    return perms_list
  end
end




