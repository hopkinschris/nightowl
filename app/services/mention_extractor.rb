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
    unless mentionees.blank?
      mentionees.each do |m|
        record m
      end
    end
  end

  def record(handle)
    if @keyword.mentions.include?(handle)
      @forward = false
    else
      @keyword.mentions << handle
      @keyword.mentions.flatten!
      @keyword.save
    end
  end
end
