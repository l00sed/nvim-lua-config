local model = "llama3.2:3b"
require("codecompanion").setup({
  display = {
    provider = "delta"
  },
  strategies = {
    chat = {
      adapter = "ollama",
    },
    inline = {
      adapter = "ollama",
    },
    agent = {
      adapter = "ollama",
    }
  },
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = model,
        schema = {
          model = {
            default = model
          },
          num_ctx = {
            default = 16384
          },
          num_predict = {
            default = -1
          }
        }
      })
    end
  },
  --opts = {
  --  ---@param adapter CodeCompanion.Adapter
  --  ---@return string
  --  system_prompt = function(opts)
  --    if opts.adapter.schema.model.default == model then
  --      return "My custom system prompt"
  --    end
  --    return "My default system prompt"
  --  end
  --}
})
