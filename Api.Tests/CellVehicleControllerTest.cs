using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Application.Person.Commands;
using Application.Person.Queries;
using Xunit;

namespace Api.Tests;


public class CellVehicleControllerTest
{

    IntegrationTestBuilder _builder;
    HttpClient _client = default!;
    private enum TypesVehicle { Carro = 1, Motocicleta };


    public CellVehicleControllerTest()
    {
         _builder = new IntegrationTestBuilder();
        _client = _builder.CreateClient();
    }


    [Fact]
    public async Task PostCellVehicleSuccess()
    {
        string plaque = IsDayPair() ? "ASD123" : "ASD658";
        var postContent = new CellVehicleCreateCommand(plaque, 150, (int)TypesVehicle.Carro);
        var content = new StringContent(System.Text.Json.JsonSerializer.Serialize(postContent), System.Text.Encoding.UTF8 , "text/json" );
        var c = await _client.PostAsync("api/CellVehicle", content);
        c.EnsureSuccessStatusCode();
        Assert.Equal(HttpStatusCode.OK, c.StatusCode);
    }

    private bool IsDayPair()
    {
        int currentDay = DateTime.Now.Day;
        return currentDay % 2 == 0;
    }


    [Fact]
    public async Task GetPersonBadRequestFailure()
    {
        var c = await _client.GetAsync($"api/CellVehicle/foobar");
        Assert.Throws<System.Net.Http.HttpRequestException>(() => c.EnsureSuccessStatusCode());
    }

}