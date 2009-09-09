class Hash
  # Performs the opposite of merge, with the keys and values from the first hash taking precedence over the second.
  def reverse_merge(other_hash)
    other_hash.merge(self)
  end

  # Performs the opposite of merge, with the keys and values from the first hash taking precedence over the second.
  # Modifies the receiver in place.
  def reverse_merge!(other_hash)
    replace(reverse_merge(other_hash))
  end
end