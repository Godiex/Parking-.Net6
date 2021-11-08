using System;
using System.Collections.Generic;
using Domain.Entities;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.VisualStudio.TestPlatform.TestHost;
using Microsoft.EntityFrameworkCore;
using Infrastructure.Context;
using Microsoft.Extensions.DependencyInjection;
using Domain.Ports;
using Microsoft.Extensions.Hosting;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace Api.Tests;

class IntegrationTestBuilder : WebApplicationFactory<Program>
{

    readonly Guid _id;

    public Guid Id => this._id;

    public IntegrationTestBuilder()
    {
        _id = Guid.NewGuid();
    }

    protected override IHost CreateHost(IHostBuilder builder)
    {
        var rootDb = new InMemoryDatabaseRoot();

        builder.ConfigureServices(services =>
        {
            services.RemoveAll(typeof(DbContextOptions<PersistenceContext>));
            services.AddDbContext<PersistenceContext>(options =>
                    options.UseInMemoryDatabase("Testing", rootDb));

        });

        SeedDatabase(builder.Build().Services);

        return base.CreateHost(builder);


    }

    void SeedDatabase(IServiceProvider services)
    {
        var People = new List<Person>
            {
                new Person
                {
                    Id = _id, Email = "JohnDoe@gmail.com", FirstName = "John",
                    LastName = "Doe", DateOfBirth = DateTime.Now.AddYears(-20)
                }
            };

        using (var scope = services.CreateScope())
        {
            var personRepo = scope.ServiceProvider.GetRequiredService<IGenericRepository<Person>>();
            foreach (var person in People)
            {
                personRepo.AddAsync(person).Wait();
            }
        }
    }
}