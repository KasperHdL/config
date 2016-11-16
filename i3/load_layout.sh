#!/bin/bash

i3-msg "workspace 1; append_layout ~/.config/i3/workspace_brave.json"
# i3-msg "workspace 10; append_layout ~/.config/i3/workspace_geary.json"
i3-msg "workspace 2; append_layout ~/.config/i3/workspace_empty.json"

# And finally we fill the containers with the programs they had
(brave &)
