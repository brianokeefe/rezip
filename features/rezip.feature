Feature: Rezipping

  Scenario: Rezipping an archive successfully
    Given a file named "foo.txt" with:
    """
    Test file
    """
    Given a directory named "baz"
    Given a file named "baz/foo.txt" with:
    """
    Test file
    """
    When I run `zip archive.zip foo.txt baz/foo.txt`
    And I run `rm foo.txt`
    And I run `rm -rf baz/`
    And I run `unzip archive.zip`
    And I run `bundle exec rezip archive.zip`
    Then a file named "foo.txt" should not exist
    And a directory named "baz" should not exist

  Scenario: The target archive does not exist
    When I run `bundle exec rezip foo.zip`
    Then the output should contain "rezip: foo.zip: no such file"

  Scenario: Target archive is not a valid zip file
    Given a file named "bar.txt" with:
    """
    Test file
    """
    When I run `bundle exec rezip bar.txt`
    Then the output should contain "rezip: bar.txt: invalid zip archive"
