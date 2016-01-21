module Kilza
  # Represents a single Class property
  class Property
    # Normalized property name
    # Starts with _ or alphanumeric character
    # and doesn't contain any special character
    attr_accessor :name

    # Original JSON property name
    attr_accessor :original_name

    # Ruby string type
    # Can be object, fixnum, float, falseclass, trueclass and nilclass
    attr_accessor :original_type

    # Property type name
    attr_accessor :type

    # Indicates if the property represents an array of objects
    attr_accessor :array
    alias_method :array?, :array

    # Indicates if the property should be used for comparing purposes
    # Used to compare if one object is equal to another one
    attr_accessor :key
    alias_method :key?, :key

    def initialize(name, type, array, key)
      @name = Kilza.normalize(name)
      @original_name = name
      @type = type
      @array = array
      @key = key
      @original_type = type
    end

    def object?
      @original_type == 'hash'
    end

    def fixnum?
      @original_type == 'fixnum'
    end

    def boolean?
      @original_type == 'trueclass' || @original_type == 'falseclass'
    end

    def float?
      @original_type == 'float'
    end

    def null?
      @original_type == 'nilclass'
    end

    def ==(pr)
      @name == pr.name
    end

    def to_s
      {
        name: @name,
        original_name: @original_name,
        type: @type,
        array?: @array
      }.to_s
    end
  end
end
