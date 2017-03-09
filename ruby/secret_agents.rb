# Release 2
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

=begin
# Release 3
puts "encrypt(\"abc\") = \"bcd\" : #{encrypt("abc") == "bcd"}"
puts "encrypt(\"zed\") = \"afe\" : #{encrypt("zed") == "afe"}"
puts "decrypt(\"bcd\") = \"abc\" : #{decrypt("bcd") == "abc"}"
puts "decrypt(\"afe\") = \"zed\" : #{decrypt("afe") == "zed"}"
# Release 4
puts "decrypt(encrypt(\"swordfish\") = \"swordfish\" : #{decrypt(encrypt("swordfish")) == "swordfish"}"
# Note to future agents: This nested method call works because the encrypt method's return type is a string,
# and the decrypt method accepts a string as a parameter. The computer will process the encrypt method first,
# the resulting value will then be used as the argument for the decrypt method.
=end

# Release 5
# Display a user prompt asking the agent whether to encrypt or decrypt password
puts "How should we process your password? Type 'e' for encrypt or 'd' for decrypt: "
# Store the agent's response
choice = gets.chomp
# Ask the agent for the password
puts "Enter your password: "
# Store the password
password = gets.chomp
# Process password based on the agent's choice
# Display the processed password
if choice == 'e'
  puts "Your encrypted password: #{encrypt(password)}"
else
  puts "Your decrypted password: #{decrypt(password)}"
end
