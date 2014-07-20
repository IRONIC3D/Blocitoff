module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def comment_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'comment has-error'
    else
      content_tag :div, capture(&block), class: 'comment'
    end
  end
end
