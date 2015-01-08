defmodule P2_helloTest do
  use ExUnit.Case
  import P2_hello

  test "hello" do
  	hello1
  	assert hello2 == "hello2 world"
  	assert hello3() == "hello3 world"
  	assert hello4 == "Nǐ hǎo shìjiè"
  	assert hello5 == "hola mundo"
    assert hello6 == "hello6\nworld\n"
    assert hello7 == "مرحبا بالعالم"
    assert hello8 == "hello8 world"
    assert hello9 == "hello9 world"
    assert hello10(:english) == "hello10 world"
  	assert hello10(:klingon) == "qo vIvan"

  end
end
