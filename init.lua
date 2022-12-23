-- NVIM v0.9.0-dev-312+gc4fcde506
-- Build type: RelWithDebInfo
-- LuaJIT 2.1.0-beta3

------------ Packer configs ---------------
local status_ok, impatient = pcall(require, "impatient")
if status_ok then
  impatient.enable_profile()
end
require('packer_nvim')
pcall(require, "packer_compiled")

--------------- Kebindings ------------------
require('mappings')

------------ General settings ---------------
require('settings')
