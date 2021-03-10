module ApplicationHelper
  FLASH_CLS = { 
      'notice' => "alert alert-primary",
      'alert' => "alert alert-warning",
      'info' => "alert alert-info" 
      }
  def flash_class(key)
    FLASH_CLS.has_key?(key) ? FLASH_CLS[key] : FLASH_CLS['info']
  end

  def year
    Time.now.year
  end
  
  def github_url(author, repo)
    (author+ "  " + link_to('TestGuru',repo, target: "_blank")).html_safe
  end
  
end
