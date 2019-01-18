# Write a function mail_joke taking one argument (the email to judge), and returning the judging sentence. For instance:

# mail_joke("boris@lewagon.org")
# #=> "Well done boris, you're skilled and capable"
# It must raise an ArgumentError if the first argument passed is not an email.

# It must correctly handle any email with an unknown domain.

EMAIL_PATTERN = /([^@]+)@([^@]+)/

def mail_joke(email)
  # TODO: Return (not print!) a joke suited to the email provided
  groups = email.match(EMAIL_PATTERN)
  if groups.nil?
    raise ArgumentError.new, "#{email} is not a valid email"
  else
    clean_name = groups[1].tr('.', ' ')
    return compute_joke(clean_name, groups[2])
  end
end

def compute_joke(name, domain)
  case domain
  when 'lewagon.org'
    return "Well done #{name}, you're skilled and capable"
  when 'gmail.com'
    return "#{name}, you're an average but modern person"
  when 'live.com'
    return "#{name}, weren't you born after 1973?"
  else
    return "Sorry #{name}, we don't know how to judge '#{domain}'"
  end
end
