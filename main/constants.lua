local M = {}

M.MAXCREW = 9

M.COLOR_SELECTION = vmath.vector4(0.5, 1, 0.5, 1)
M.COLOR_BUTTONS = vmath.vector4(0.5, 0.75, 1, 1)
M.COLOR_DISABLED = vmath.vector4(0.4, 0.4, 0.4, 1)
M.COLOR_ENABLED = vmath.vector4(0.5, 1, 0.7, 1)
M.COLOR_DEFAULT = vmath.vector4(1, 1, 1, 1)

M.SKINTONE = {}
table.insert(M.SKINTONE, vmath.vector4(1, 0.85, 0.67, 1))
table.insert(M.SKINTONE, vmath.vector4(0.95, 0.76, 0.49, 1))
table.insert(M.SKINTONE, vmath.vector4(0.88, 0.67, 0.41, 1))
table.insert(M.SKINTONE, vmath.vector4(0.77, 0.52, 0.26, 1))
table.insert(M.SKINTONE, vmath.vector4(0.55, 0.33, 0.14, 1))

M.HAIRCOLOR = {}
table.insert(M.HAIRCOLOR, vmath.vector4(0.33, 0.24, 0.20, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.57, 0.33, 0.24, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.55, 0.29, 0.26, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.70, 0.32, 0.22, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.65, 0.42, 0.27, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.72, 0.59, 0.47, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.87, 0.74, 0.60, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(1.00, 0.96, 0.88, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.86, 0.81, 0.73, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.84, 0.77, 0.76, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.72, 0.65, 0.62, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.44, 0.39, 0.35, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.17, 0.13, 0.17, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.04, 0.03, 0.02, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.2, 0.8, 0.2, 1))
table.insert(M.HAIRCOLOR, vmath.vector4(0.15, 0.1, 0.7, 1))

M.EYECOLOR = {}
table.insert(M.EYECOLOR, vmath.vector4(0.12, 0.28, 0.6, 1))
table.insert(M.EYECOLOR, vmath.vector4(0.33, 0.13, 0, 1))
table.insert(M.EYECOLOR, vmath.vector4(0.27, 0.72, 0.29, 1))
table.insert(M.EYECOLOR, vmath.vector4(0.58, 0.68, 0.71, 1))

M.MAXFUEL = 5
M.MAXRATIONS = 20

return M