# The following list contains the names of individuals who are pioneers
# in the field of computing or that have had a significant influence
# on the field. The names are in an encrypted form, though, using a simple
# (and incredibly weak) form of encryption called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

ENCRYPTED_PIONEERS = ['Nqn Ybirynpr',
                      'Tenpr Ubccre',
                      'Nqryr Tbyqfgvar',
                      'Nyna Ghevat',
                      'Puneyrf Onoontr',
                      'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
                      'Wbua Ngnanfbss',
                      'Ybvf Unvog',
                      'Pynhqr Funaaba',
                      'Fgrir Wbof',
                      'Ovyy Tngrf',
                      'Gvz Orearef-Yrr',
                      'Fgrir Jbmavnx',
                      'Xbaenq Mhfr',
                      'Fve Nagbal Ubner',
                      'Zneiva Zvafxl',
                      'Lhxvuveb Zngfhzbgb',
                      'Unllvz Fybavzfxv',
                      'Tregehqr Oynapu']
ALPHABET = ('a'..'z').to_a

def rot13(encrypted_text)
  encrypted_text.chars.map { |char| decipher_char(char) }.join
end

def decipher_char(encrypted_char)
  return encrypted_char unless ALPHABET.include?(encrypted_char.downcase)

  rot13_index = (ALPHABET.index(encrypted_char.downcase) + 13) % 26
  rot13_char = ALPHABET[rot13_index]
  encrypted_char == encrypted_char.upcase ? rot13_char.upcase : rot13_char
end

ENCRYPTED_PIONEERS.each { |encrypted_name| puts rot13(encrypted_name) }
