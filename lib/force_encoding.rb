require 'java'

require 'force_encoding/version'
require File.expand_path("../../libs/jruby-force-encoding-#{ForceEncoding::VERSION}.jar", __FILE__)

module ForceEncoding
  java_import 'net.infweb.forceencoding.RailsPluginJavaUtil'

  RailsPluginJavaUtil.tap do |c|
    java_converters_field = org.jruby.javasupport.JavaUtil.java_class.declared_field("JAVA_CONVERTERS")
    java_converters_field.accessible = true
    java_converters = java_converters_field.static_value.to_java
    java_converters.put(java.lang.String.java_class, c)
  end
end
