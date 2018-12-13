 function newSkeletonQuery (_age, _sex, _leglength)
      local self = {
          age = _age, 
          sex = _sex, 
          leglength = _leglength,
        }
      
      local male = function()
                      if self.age > 30 then
                        return (69.089 + 2.238 * self.leglength - (self.age - 30) * 0.06)
                      else
                        return (69.089 + 2.238 * self.leglength)
                      end
                    end 
      
      local female = function()
                        if self.age > 30 then
                          return (61.412 + 2.317 * self.leglength - (self.age - 30) * 0.06)
                        else
                          return (61.412 + 2.317 * self.leglength)
                        end        
                      end
      
      local blength = function () 
                        if self.sex == "m" then
                          return male()
                        else
                          return female()
                        end
                      end
  
      return {
        blength = blength
      }
  end
        
querym40 = newSkeletonQuery(40,"m",50)
querym20 = newSkeletonQuery(20,"m",50)
queryf40 = newSkeletonQuery(40,"f",50)
queryf20 = newSkeletonQuery(20,"f",50)
print("m40: "..querym40.blength())
print("m20: "..querym20.blength())
print("f40: "..queryf40.blength())
print("f20: "..queryf20.blength())