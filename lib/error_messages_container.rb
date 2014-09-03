require "error_messages_container/version"

module ErrorMessagesContainer
  class ErrorMessages

    class << self
      # stub
    end

    # available args:
    #   base_name - name of the default section
    #   error_messages - Array or String with error message(s) for base section
    def initialize(args = {})
      @error_messages = {base: []}
      @group_names = {base: args[:base_name] || 'base_section'}
      define_group_reader(:base)
      self.add(args[:error_messages]) if args.has_key?(:error_messages)
    end

    def add(error, group_name = :base)
      if error.is_a?(String)
        @error_messages[group_name.to_sym] << error
      elsif error.is_a?(Array)
        @error_messages[group_name.to_sym] += error
      end
    end

    def add_group(group_name, group_description)
      if @error_messages[group_name.to_sym].blank? && @group_names[group_name.to_sym].blank?
        @error_messages[group_name.to_sym] = []
        @group_names[group_name.to_sym] = group_description
        define_group_reader(group_name)
      end
    end

    def all_messages
      @error_messages.reject{|_, messages| messages.blank?}
    end

    def messages_for_group(group_name)
      @error_messages[group_name.to_sym]
    end

    def all_group_names
      @group_names
    end

    def name_for_group(group_name)
      @group_names[group_name.to_sym]
    end

    def all_group_types
      @error_messages.keys
    end

    def blank?
      @error_messages.values.collect(&:blank?).all?
    end

    def present?
      !blank?
    end

    private

    # дефайн методов для удобного получения ошибок в группе и названия группы
    # define methods for comfortable access to error group and group name
    def define_group_reader(group_name)
      class_eval <<-EOT, __FILE__, __LINE__ + 1
      def #{group_name}_group_messages          # def base_group_messages
        @error_messages[:#{group_name}]         #   @error_messages[:base]
      end                                       # end

      def #{group_name}_group_name              # def base_group_name
        @group_names[:#{group_name}]            #   @group_names[:base]
      end                                       # end
      EOT
    end

  end
end
