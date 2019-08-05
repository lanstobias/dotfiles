-- keyname script_binding picture_in_picture
local utils = require 'mp.utils'

function picture_in_picture()
    if not mp.set_property("ontop", "yes") then
        print("Error: could not call ontop")
    end
    if not mp.set_property("window-scale", "0.4") then
        print("Error: could not call window-scale")
    end

    print("Picture-in-picture")
end

mp.add_key_binding('h', 'picture_in_picture', picture_in_picture)

