require 'erb'

def vagrant_shell_scripts_configure(shell, scripts_path, provision_script)
  renderer = ERB.new(<<-eo
                    <%
                      def source(filename)
                        file = File.join("#{scripts_path}", filename)
                        if File.file? file
                          return ERB.new(File.read(file)).result(binding)
                        end
                      end
                    %>
                    <%= source '#{provision_script}' %>
                    eo
                    )
  shell.inline = renderer.result
end
