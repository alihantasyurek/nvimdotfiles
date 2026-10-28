return {
  on_init = function(client)
    client.server_capabilities.foldingRangeProvider = false
  end,
}
