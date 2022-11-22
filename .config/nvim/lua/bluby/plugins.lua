local function optreq(pkg)
    local ok, _ = pcall(require, pkg)
    if not ok then
        print("Failed to load " .. pkg)
    end
end

optreq('bluby.packer')

optreq('treesitter-context')

