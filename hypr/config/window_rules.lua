-- Ignore maximize requests from all apps
hl.window_rule({
    name = "suppress-maximize-all",
    match = { class = ".*" },
    suppress_event = "maximize"
})

-- Fix dragging issues with XWayland ghost windows
hl.window_rule({
    name = "fix-xwayland-dragging",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },
    no_focus = true
})

-- Open Dolphin file manager as a centered floating window
hl.window_rule({
    name = "dolphin-floating",
    match = { class = "^(org%.kde%.dolphin)$" },
    float = true,
    size = { 1000, 700 },
    center = true
})

-- Open Brave file manager dialogs as centered floating windows
hl.window_rule({
    name = "brave-file-explorer",
    match = {
        class = "^(brave)$",
        title = "^(.*wants to .*)$"
    },
    float = true,
    size = { 1000, 700 },
    center = true
})

-- Open Brave untitled popups as centered floating windows
hl.window_rule({
    name = "brave-untitled-popups",
    match = {
        class = "^(brave-browser)$",
        title = "^(Untitled - Brave)"
    },
    float = true,
    size = { 1000, 700 },
    center = true
})

-- Open LibreOffice open file dialogs as centered floating windows
hl.window_rule({
    name = "libreoffice-open-dialog",
    match = {
        class = "soffice",
        title = "Open"
    },
    float = true,
    size = { 1000, 700 },
    center = true
})

-- Open Cisco PacketTracer secondary windows as centered floating windows
hl.window_rule({
    name = "packettracer-dialogs",
    match = {
        class = "PacketTracer",
        title = "negative:^Cisco Packet Tracer$"
    },
    float = true,
    size = { 1000, 700 },
    center = true
})

-- Force Aseprite to open maximized
hl.window_rule({
    name = "aseprite-maximized",
    match = { class = "^(Aseprite)$" },
    maximize = true
})
