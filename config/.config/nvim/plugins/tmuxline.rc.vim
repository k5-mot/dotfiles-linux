"let g:tmuxline_preset = 'full'
let g:tmuxline_preset = {
      \'a'    : ['\ue795 #(whoami)@#h'],
      \'b'    : ['#S', '#P'],
      \'c'    : ['#{cpu_icon} #{cpu_percentage}', '#{net_speed}', '#{battery_icon_status}', '#{online_status}'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : ['\uf017 %H:%M:%S'],
      \'y'    : ['\uf073 %Y/%m/%d (%a)'],
      \'z'    : ['#(os_icon.sh) #(os_name.sh)']}
let g:tmuxline_theme = 'gruvbox_material'

