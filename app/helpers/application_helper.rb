module ApplicationHelper
  def repo_watchers(repo)
    return thousand_format(repo) if repo["watchers"] >= 1000
    repo['watchers']
  end

  def repo_topics(repo)
    return ['No topics available'] if repo['topics'].empty?
    repo['topics']
  end

  private

  def thousand_format(repo)
    "#{repo['watchers'] / 1000}k" 
  end
end

