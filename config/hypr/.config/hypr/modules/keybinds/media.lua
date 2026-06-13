--- Media Control ---

local utils = require("modules.vars.utilities")

-- Volume control :
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(utils.volume.up))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(utils.volume.down))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(utils.volume.mute))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(utils.volume.micMute))

-- Player Control :
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(utils.player.playPause))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(utils.player.playPause))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(utils.player.next))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(utils.player.prev))

