package net.infweb.forceencoding;

import org.jcodings.Encoding;
import org.jcodings.exception.InternalException;
import org.jruby.javasupport.JavaUtil;
import org.jruby.Ruby;
import org.jruby.RubyString;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.util.ByteList;

import java.util.Map;

public class RailsPluginJavaUtil {
    private static final String ENV_VAR_KEY = "JRUBY_DEFAULT_ENCODING";

    public static final JavaUtil.JavaConverter JAVA_STRING_CONVERTER = new JavaUtil.JavaConverter(String.class) {
        public IRubyObject convert(Ruby runtime, Object object) {
            if (object == null) return runtime.getNil();
            String source = (object instanceof String) ? (String)object : object.toString();
            IRubyObject target = null;
            Map<String, String> env = System.getenv();
            if (env.containsKey(ENV_VAR_KEY)) {
                try {
                    Encoding e = Encoding.load(env.get(ENV_VAR_KEY));
                    ByteList bytes = new ByteList(source.getBytes(), e);
                    target = RubyString.newString(runtime, bytes);
                } catch (InternalException ex) {
                    System.err.println(String.format("Invalid encoding %s. Using unicode...", env.get(ENV_VAR_KEY)));
                    target = RubyString.newUnicodeString(runtime, source);
                }
            } else {
                target = RubyString.newUnicodeString(runtime, source);
            }
            return target;
        }
        public IRubyObject get(Ruby runtime, Object array, int i) {
            return convert(runtime, ((String[]) array)[i]);
        }
        public void set(Ruby runtime, Object array, int i, IRubyObject value) {
            ((String[])array)[i] = (String)value.toJava(String.class);
        }
    };
}