require! {
  chai: {expect}
  '../index': base85
}

# Polyfill Buffer.from
buffer-from =
  try
    Buffer.from [0]
    Buffer.from
  catch
    -> new Buffer ...

It = global.it

describe 'base85' ->
  describe '.encode' ->
    It 'encodes buffer to base85 string' ->
      # 4bytes in the input buffer are mapped to 5 character
      expect base85.encode buffer-from '00000000' \hex
      .to.equal 'E00000\n'
