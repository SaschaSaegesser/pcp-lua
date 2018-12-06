function removeElement(elems)
  local local_elems = elems
  return function(elem)
    table.remove(local_elems, elem)
    print_elems(local_elems)
    return local_elems
  end
end

function print_elems(elems)
  for k,v in ipairs(elems) do
    print(k,v)
  end
end

values = {"a", "b", "c"}
print("First table:")
table1 = removeElement(values)
table1(1)

values = {"a", "b", "c"}
print("Second table:")
table2 = removeElement(values)
table2(2)

values = {"a", "b", "c"}
print("Third table:")
table3 = removeElement(values)
table3(3)