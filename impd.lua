local utils = require"mp.utils"

local current_file
local function exec_impd_add(t)
    -- don't run if the file ended for other reasons
    if t and t.reason ~= "eof" then
        return
    end

    mp.osd_message("Adding file to impd")
    mp.commandv("run", "tsp", "impd", "add", current_file)
end

mp.register_event("file-loaded", function()
    current_file = mp.get_property"path"
end)

mp.register_event("end-file", exec_impd_add)
mp.add_key_binding("ctrl+i", exec_impd_add)
