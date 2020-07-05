ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if instance.error_message.kind_of?(Array)
    %(<div class="error-field">#{html_tag}<span class="text-danger">&nbsp;
      #{instance.error_message.join(',')}</span></div>).html_safe
  else
    %(<div class="error-field">#{html_tag}<span class="text-danger">&nbsp;
      #{instance.error_message}</span></div>).html_safe
  end
end