# Encrypt
# Iterate through each letter using a while loop
# Within the while loop, if the character is 'z', change it to 'a';
# If the character is a ' ' (space), skip it;
# Otherwise, change the character to its succeeding letter in the alphabet
# After exiting the loop, return the encrypted password

def encrypt(password)
  i = 0
  while i < password.length
    if password[i] == 'z'
      password[i] = 'a'
    elsif password[i] == ' '
      next
    else
      password[i] = password[i].next!
    end
    i += 1
  end
  password
end
