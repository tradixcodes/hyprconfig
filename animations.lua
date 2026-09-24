-- -- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
-- hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
-- hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
-- hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
-- hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
--
-- -- my curve animations
-- hl.curve("myBounce", { type = "bezier", points = { { 1, 0 }, { 0.25, 1 } } })
-- hl.curve("rubber", { { type = "spring", mass = 1, stiffness = 70, dampening = 10 } })
--
-- -- Default springs
-- hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })
--
-- hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
-- hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "rubber" })
-- hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "rubber", style = "popin 87%" })
-- hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
-- hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
-- hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
-- hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- OG curves
hl.curve("ease-in-out", { type = "bezier", points = { { 0.42, 0 }, { 0.58, 1 } } })
hl.curve("ease-in-out-back", { type = "bezier", points = { { 0.68, -0.6 }, { 0.32, 1.6 } } })

-- my own curves
hl.curve("myBounce", { type = "bezier", points = { { 1, 0 }, { 0.25, 1 } } })
hl.curve("rubber", { type = "spring", mass = 1, stiffness = 70, dampening = 10 })
hl.curve("scifi_charge", { type = "bezier", points = { { 0.9, 1 }, { 1, 1.05 } } })
hl.curve("scifi_discharge", { type = "bezier", points = { { 0, 0 }, { 0.1, -0.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, spring = "rubber" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2, bezier = "scifi_charge", style = "gnomed" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "ease-in-out", style = "popin 85%" })
