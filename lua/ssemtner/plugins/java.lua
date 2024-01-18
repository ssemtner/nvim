return {
  'mfussenegger/nvim-jdtls',
  config = function()
    local function get_bundles()
      local mason_reg = require("mason-registry")
      local function get_adapter_bundle()
        local pkg = mason_reg.get_package("java-debug-adapter")
        local pkg_install_path = pkg:get_install_path()
        local pkg_jar_glob = pkg_install_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
        local pkg_jar = vim.fn.glob(pkg_jar_glob, true);
        return pkg_jar
      end
      local function get_vscode_java_test_bundles()
        local pkg = mason_reg.get_package("java-test")
        local pkg_install_path = pkg:get_install_path()
        local pkg_jars_glob = pkg_install_path .. "/extension/server/*.jar"
        local pkg_jars = vim.fn.glob(pkg_jars_glob, true);
        local pkg_jars_list = vim.split(pkg_jars, "\n")
        return pkg_jars_list
      end
      local bundles = {
        get_adapter_bundle(),
      };
      vim.list_extend(bundles, get_vscode_java_test_bundles())
      return bundles
    end

    local function get_jdtls_path()
      local pkg = require('mason-registry').get_package('jdtls')
      local pkg_install_path = pkg:get_install_path()
      return pkg_install_path
    end

    local jdtls_path = get_jdtls_path()

    require('jdtls').start_or_attach({
      cmd = {

        -- 💀
        'java', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        -- 💀
        '-jar',
        jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version


        -- 💀
        '-configuration', jdtls_path ..'/config_mac',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.


        -- 💀
        -- See `data directory configuration` section in the README
        -- TODO: don't hardcode this
        '-data', '/Users/sjsem/Developer/ucsd/cse12/pa/'
      },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', '.pa' }, { upward = true })[1]),
      init_options = {
        bundles = get_bundles()
      },
    })
  end
}
