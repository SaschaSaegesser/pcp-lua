function removeElement(elements)
  local elems = elements
  local i = 0
  return function(elem) -- Ananymous function
    if (type(elem) == "string") then -- Value is a string (remove by value)
      for k, v in ipairs(elems) do
        if elems[k] == elem then
          table.remove(elems, k)
          break
        end
      end
    else -- Value is a number (remove by index)
      table.remove(elems, elem)
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

print("First table:")
table1 = removeElement({"a", "b", "c"})
table1("b")

print("Second table:")
table2 = removeElement({"a", "b", "c"})
table2("c")

print("First table:")
table1(1)