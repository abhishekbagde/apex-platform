using Xunit;
using Moq;
using ApexService.Controllers;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.Logging;

namespace ApexService.Tests
{
    public class WeatherControllerTests
    {
        private readonly Mock<ILogger<WeatherController>> _mockLogger;

        public WeatherControllerTests()
        {
            _mockLogger = new Mock<ILogger<WeatherController>>();
        }

        [Fact]
        public void GetWeatherForecast_ReturnsOkResult_WithFiveWeatherForecasts()
        {
            // Arrange
            var controller = new WeatherController(_mockLogger.Object);

            // Act
            var result = controller.Get();

            // Assert
            var okResult = Assert.IsType<OkObjectResult>(result);
            var returnValue = Assert.IsType<IEnumerable<WeatherForecast>>(okResult.Value);
            Assert.Equal(5, returnValue.Count());
        }

        [Theory]
        [InlineData(1)]
        [InlineData(3)]
        [InlineData(5)]
        public void GetById_WithValidId_ReturnsOkResult_WithSingleWeatherForecast(int id)
        {
            // Arrange
            var controller = new WeatherController(_mockLogger.Object);

            // Act
            var result = controller.GetById(id);

            // Assert
            var okResult = Assert.IsType<OkObjectResult>(result);
            var returnValue = Assert.IsType<WeatherForecast>(okResult.Value);
            Assert.NotNull(returnValue);
        }

        [Theory]
        [InlineData(0)]
        [InlineData(6)]
        [InlineData(-1)]
        public void GetById_WithInvalidId_ReturnsNotFoundResult(int id)
        {
            // Arrange
            var controller = new WeatherController(_mockLogger.Object);

            // Act
            var result = controller.GetById(id);

            // Assert
            Assert.IsType<NotFoundObjectResult>(result);
        }
    }
}