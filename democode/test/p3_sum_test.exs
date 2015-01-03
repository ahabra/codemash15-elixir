defmodule P3_sumTest do
  use ExUnit.Case
  import P3_sum

  test "hello" do
    assert sum1(1,4) == 10
    assert sum2(1,4) == 10
    assert sum3(1,4) == 10
    assert sum4(1,4) == 10
    assert sum5(1,4) == 10

    assert sumOfMillion == 500_000_500_000
  end
end
