module ApplicationHelper
  def year
    Time.now.year
  end

  def github_url(author, repo)
    (author+ "  " + link_to('TestGuru',repo, target: "_blank")).html_safe
  end

end
