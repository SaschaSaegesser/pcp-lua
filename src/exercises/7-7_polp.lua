phonebook = {}

--returns a proxy table where any attempt to read gives the original value
--and any attempt to write throws an error
function readOnly (table)
  local proxy = {
        search = function(name)
         print("Name: " .. name .. " Nummer: " .. phonebook[name]) 
      end
}
  local mt = {       -- create metatable
    __index = table,     -- will be called/returned whenever the given value is non-existent in the table
    __newindex = function (table,key,value)  -- will be called whenever the caller tries to (over)write a value
      error("You can only read from this table, not write or update.", 2) 
    end
    

  }

  setmetatable(proxy, mt)
  return proxy
end

--returns the orignal table with a new metatable
function readWrite (table)
  --[[local mt = {       -- create metatable
    __index = table,     -- will be called/returned whenever the given value is non-existent in the table
    __newindex = function (table,key,value)  -- will be called whenever the caller tries to (over)write a value
      table[key] = value
      
    end
  }]]
  -- setmetatable(table, mt)
  return table
end


--define user
user = readOnly(phonebook)
--define admin
admin = readWrite(phonebook)
admin2 = readWrite(phonebook)

--add entries
admin["Matthias"] = 417802244
admin["Horst"] = 417800044
admin["Adi"] = 417802200


user.search("Matthias")
admin["Matthiass"] = 418008000

