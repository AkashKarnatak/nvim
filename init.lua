-- NVIM v0.9.0-dev-312+gc4fcde506
-- Build type: RelWithDebInfo
-- LuaJIT 2.1.0-beta3

------------ Packer configs ---------------
require('impatient').enable_profile()
require('packer_nvim')
require('packer_compiled')

--------------- Kebindings ------------------
require('mappings')

------------ General settings ---------------
require('settings')
