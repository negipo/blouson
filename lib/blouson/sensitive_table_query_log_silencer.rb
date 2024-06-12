module Blouson
  class SensitiveTableQueryLogSilencer < Arproxy::Base
    def execute(sql, *, **)
      if Rails.logger.level != Logger::DEBUG || !(Blouson::SENSITIVE_TABLE_REGEXP === sql)
        return super
      end

      ActiveRecord::Base.logger.silence(Logger::INFO) do
        Rails.logger.info "  [Blouson::SensitiveTableQueryLogSilencer] SQL Log is skipped for sensitive table"
        super
      end
    end

    def exec_query(sql, *, **)
      if Rails.logger.level != Logger::DEBUG || !(Blouson::SENSITIVE_TABLE_REGEXP === sql)
        return super
      end

      ActiveRecord::Base.logger.silence(Logger::INFO) do
        Rails.logger.info "  [Blouson::SensitiveTableQueryLogSilencer] SQL Log is skipped for sensitive table"
        super
      end
    end

    def internal_exec_query(sql, *, **)
      if Rails.logger.level != Logger::DEBUG || !(Blouson::SENSITIVE_TABLE_REGEXP === sql)
        return super
      end

      ActiveRecord::Base.logger.silence(Logger::INFO) do
        Rails.logger.info "  [Blouson::SensitiveTableQueryLogSilencer] SQL Log is skipped for sensitive table"
        super
      end
    end
  end
end
