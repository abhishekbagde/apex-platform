using Xunit;

namespace ApexService.Tests
{
    public class ExampleTests
    {
        [Fact]
        public void True_ShouldBeTrue()
        {
            // Arrange
            bool expected = true;

            // Act
            bool actual = true;

            // Assert
            Assert.Equal(expected, actual);
        }
    }
}