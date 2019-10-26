-----------------------------------------------------------------------------------------
--
-- general_functions.lua
--
-- module that contains all the common functions used throughout the application
--
-----------------------------------------------------------------------------------------


function create_new_folder(folderName)
  -- This function creates a new folder from within the App
  -- Files will Appear in Sandbox within the Simulator
  -- C:\Users\$USER\AppData\Local\Corona Labs\Corona Simulator\Sandbox
  -- raw path to document directory
  -- STATUS : COMPLETE
  local docs_path = system.pathForFile( "" , system.ResouceDirectory )
  local success = lfs.chdir(docs_path) -- change current working directory, returns true on success
  local new_folder_path
  local dname = folderName
  -- upon successful file access creates the folder
  if(success) then
    lfs.mkdir(dname)
    new_folder_path = lfs.currentdir() .. "/" .. dname -- creates the new folder
  end
end



function read_data_file(FilePath)
  -- This function opens a CSV file and writes the data to Table

  -- Example Output :
  -- 1:(y,3)(x,4)(o,a)
  -- 2:(y,3)(x,1)(o,a)
  -- 3:(y,3)(x,3)(o,a)
  -- 4:(y,7)(x,3)(o,a)
  -- 5:(y,4)(x,7)(o,a)
  -- 6:(y,1)(x,4)(o,a)

  -- STATUS : COMPLETE

  if FilePath == nil then defaultFilePath = "training_data\\knn.csv" end -- default

  local path = system.pathForFile( defaultFilePath, system.ResourceDirectory ) -- Path for the file to read 
  local file, errorString = io.open( path, "r" ) -- Open the file handle
  t = {} -- temporary table
  if not file then
      print( "File error: " .. errorString )     -- Error occurred; output the cause
  else
      for line in file:lines() do     -- Output lines
          -- print( line )
          local _x, _y, _o = line:match("(%d+),(%d+),(%a+)")
          -- print (_x .. ',' .. _y .. ' = ' .. _o)
          t[#t + 1] = { x = _x , y = _y , o = _o }
          -- t[#t + 1] = line:match("(%d+),(%d+),(%a+)")
      end
      -- Close the file handle
      io.close( file )
  end
  file = nil
  return t -- return table
end



function print_table(tableName) 
  -- This function prints the data table in a loop,
  -- all contents listed down according to their keys
  -- eg:..
  -- 23:(y,4)(x,7)(output,b)
  for k,v in ipairs(tableName) do
    local outstring = "" 
    for m,n in pairs(v) do
      capture = '(' .. m .. ':' .. n .. ')'
      outstring = outstring .. capture 
    end
    print(k .. '-' .. '\t' .. outstring)
  end
end


function folder_traversal()
  -- This function prints the data table in a loop,
  -- all contents listed down according to their keys
  -- eg:..
  -- 23:(y,4)(x,7)(output,b)
  -- STATUS : INCOMPLETE

  local lfs = required ( 'lfs' )
  local doc_path = system.pathForFile( "", system.DocumentsDirectory )
  print(doc_path)
  for file in lfs.dir(doc_path) do
    print("found file: " .. file) 
  end
end


-----------RANK TABLE-------------
------------- GET k and the distances
------------- MAKE NEW TABLE WITH : k and the distances

function compare(a,b)
  return a[1].euc < b[1].euc
end

-- table.sort(updated_table, compare)

