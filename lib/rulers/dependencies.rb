class Object
  def self.const_missing(c)
    return nil if @calling_const_missing

    @calling_const_missing = true
    require Rulers.to_underscore(c.to_s)
    klass = Object.const_get(c)
    @calling_const_missing = false

    klass
  end

  def instance_variables_hash
    Hash[instance_variables.map { |name| [name, instance_variable_get(name)] }]
  end
end
