function removeElement(elements) -- First-class function
  local elems = elements
  local i = 0
  return function(elem) -- Anonyme Funktion
    for k, v in ipairs(elems) do
      if elems[k] == elem then
        table.remove(elems, k)
        break
      end
    end
    print_table(elems)
    i = i + 1
    print("calls:", i)
  end
end

function print_table(elems)
  for k,v in ipairs(elems) do
    print(k,v)
  end
end

print("First list:")
list1 = removeElement({"a", "b", "c"})
list1("b")

print("Second list:")
list2 = removeElement({"a", "b", "c"})
list2("c")

print("First list:")
list1("a")