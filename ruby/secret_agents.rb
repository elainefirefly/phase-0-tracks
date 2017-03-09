# Encrypt
# Iterate through each letter using a while loop
# Within the while loop, if the character is 'z', change it to 'a';
# If the character is a ' ' (space), skip it;
# Otherwise, change the character to its succeeding letter in the alphabet
# After exiting the loop, return the encrypted password

def encrypt(password)
  i = 0
  while i < password.length
    if password[i] == "z"
      password[i] = "a"
    elsif password[i] == " "
      next
    else
      password[i] = password[i].next!
    end
    i += 1
  end
  password
end

# Decrypt
# Create an alphabet string
# Iterate through each letter using a while loop
# Within the while loop, if the character is ' ' (space), skip it;
# Otherwise, get the index of the character in the alphabet string;
#   Then, subtract 1 from the index and assign the difference to an idx variable
#   Change the current password character with the alphabet letter that corresponds to the idx variable
# After exiting the loop, return the decrypted password

def decrypt(password)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  i = 0
  while i < password.length
    if password[i] == " "
      next
    else
      idx = alphabet.index(password[i]) - 1
      password[i] = alphabet[idx]
    end
    i += 1
  end
  password
end
