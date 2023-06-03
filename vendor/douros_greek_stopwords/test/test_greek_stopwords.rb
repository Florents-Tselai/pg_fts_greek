# frozen_string_literal: true

require "test_helper"

class TestGreekStopwords < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GreekStopwords::VERSION
  end

  def test_it_loads_txt_files
    refute_nil ::GreekStopwords::List.new
  end

  def test_it_builds_stopwords_array
    assert_kind_of(Array, ::GreekStopwords::List.new.all)
  end
end
