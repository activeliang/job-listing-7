module JobsHelper

  def render_job_status(job)
    if job.is_hidden
      content_tag(:i, "", class: "fa fa-lock")
    else
      content_tag(:i, "", class: "fa fa-globe")
    end
  end

  def resource_name
:user
end

def resource
@resource ||= User.new
end

def devise_mapping
@devise_mapping ||= Devise.mappings[:user]
end
end
