module ApplicationHelper
  def active_if_path_is(path)
    'active' if request.path == path
  end
end
