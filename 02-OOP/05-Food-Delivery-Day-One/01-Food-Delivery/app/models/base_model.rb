# meta programming

class BaseModel
  def self.inherited(klass)
    # klass.attr_accessor(:id)
    klass.send(:attr_accessor, :id)
  end

  def self.attributes(*attr_names)
    # Customer.send(:attr_accessor, *attrs)
    send(:attr_reader, *attr_names)

    define_method(:initialize) do |attrs|
      attrs ||= {}
      @id = attrs[:id]

      attr_names.each do |attr_name|
        instance_variable_set("@#{attr_name}", attrs[:"#{attr_name}"])
      end
    end
  end
end
