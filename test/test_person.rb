require "minitest/autorun"
require "person"

class TestPerson < Minitest::Test
    def test_introduction
        person = Person.new
        person.name = "Bob"
        assert(person.introduction) == "Hello may name is Bob!"
    end
end
