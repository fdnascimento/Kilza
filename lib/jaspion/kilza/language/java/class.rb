module Jaspion
  module Kilza
    class Java
      class Class
        include Jaspion::Kilza::Class

        # Represents the Java class package
        attr_accessor :package

        attr_reader :gson
        attr_reader :serializable
        attr_reader :parcelable

        alias :gson? :gson
        alias_method :serializable?, :serializable
        alias_method :parcelable?, :parcelable

        def initialize(name, package = nil)
          name = name + RESERVED_CLASS_POSFIX unless RESERVED_WORDS.index(name.downcase).nil?
          super(name)

          @package = package
          @implements = []

          push_import('import org.json.*;')

          self.serializable = true
          self.parcelable = false
          self.gson = true
        end

        def push(pr)
          pr.gson = gson?

          pr.type = pr.class_name if pr.object? || (pr.array? && pr.null?)
          push_import('import java.util.ArrayList;') if pr.array?
          pr.type = Jaspion::Kilza::Java::TYPES[pr.type] unless Jaspion::Kilza::Java::TYPES[pr.type].nil?

          super(pr)
        end

        def push_implements(implement)
          @implements.push(implement)
        end

        def implements
          @implements.sort
        end

        def gson=(g)
          @gson = g

          v = %w(
            import\ com.google.gson.Gson;
            import\ com.google.gson.GsonBuilder;
            import\ com.google.gson.annotations.SerializedName;
            import\ com.google.gson.annotations.Expose;
          )

          if (g)
            push_import(v)
          else
            delete_import(v)
          end
        end

        def parcelable=(p)
          @parcelable = p

          v = 'import android.os.Parcelable;'
          if (p)
            push_implements('Parcelable')
            push_import(v)
          else
            implements.delete('Parcelable')
            delete_import(v)
          end
        end

        def serializable=(s)
          @serializable = s

          v = 'import java.io.Serializable;'
          if (s)
            push_implements('Serializable')
            push_import(v)
          else
            implements.delete('Serializable')
            delete_import(v)
          end
        end

        def sources
          [code('java', 'java')]
        end
      end
    end
  end
end
