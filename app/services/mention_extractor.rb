class MentionExtractor
  REGEX = /@([a-z0-9_]+)/i

  def initialize(keyword, artifact)
    @keyword = keyword
    @artifact = artifact
    @forward = true
  end

  def perform
    extract_actor
    extract_mentionees
  end

  private

  def extract_actor
    actor = @artifact.user.username
    record actor
  end

  def extract_mentionees
    mentionees = @artifact.text.scan(REGEX).flatten!
    record mentionees unless mentionees.blank?
  end

  def record(handle)
    if @keyword.mentions.include?(handle)
      @forward = false
    else
      @keyword.mentions << handle
      @keyword.save
    end
  end
end
