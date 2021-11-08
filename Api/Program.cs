using System.Reflection;
using Api.Filters;
using Elastic.Apm.NetCoreAll;
using Elastic.Apm.SerilogEnricher;
using ICBF.MICAV.Infrastructure.Initialize;
using Infrastructure.Context;
using Infrastructure.Extensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Prometheus;
using Serilog;
using Serilog.Sinks.Elasticsearch;

var builder = WebApplication.CreateBuilder(args);
var config = builder.Configuration;

builder.Services.AddControllers(opts =>
{
    opts.Filters.Add(typeof(AppExceptionFilterAttribute));
});

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddMediatR(Assembly.Load("Application"), typeof(Program).Assembly);
builder.Services.AddAutoMapper(Assembly.Load("Application"));

builder.Services.AddDbContext<PersistenceContext>(opt =>
{
    opt.UseSqlServer(config.GetConnectionString("database"), sqlopts =>
    {
        sqlopts.MigrationsHistoryTable("_MigrationHistory", config.GetValue<string>("SchemaName"));
    });
});

builder.Services.AddHealthChecks().AddSqlServer(config["ConnectionStrings:database"]);

builder.Services.AddLogging(loggingBuilder => loggingBuilder.AddSerilog(dispose: true));

builder.Services.AddPersistence(config).AddDomainServices().AddRabbitSupport(config);

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new() { Title = "Block Api", Version = "v1" });
});

Log.Logger = new LoggerConfiguration().Enrich.FromLogContext()    
    .WriteTo.Console()
    // comment this out to send logs to file
    //.WriteTo.File($"Api-{DateTime.Now.Millisecond}.log", rollingInterval: RollingInterval.Day)
    // comment this out if logging to elastic is available
    /*.WriteTo.Elasticsearch(new ElasticsearchSinkOptions(new Uri("http://localhost:9200"))
    {
        AutoRegisterTemplate = true,
        FailureCallback = e => Console.WriteLine("Unable to submit event " + e.MessageTemplate),
        EmitEventFailure = EmitEventFailureHandling.WriteToSelfLog |
                                       EmitEventFailureHandling.WriteToFailureSink |
                                       EmitEventFailureHandling.RaiseCallback | EmitEventFailureHandling.ThrowException,
        AutoRegisterTemplateVersion = AutoRegisterTemplateVersion.ESv7,
        IndexFormat = "netbackend-log-{0:yyyy.MM}",
        ModifyConnectionSettings = x =>
        {
            x.BasicAuthentication("elastic", "J0867KUe88ukTMR7D8OpDL12");
            x.ServerCertificateValidationCallback((a, b, c, d) => true);
            return x;
        }
    })*/
    .CreateLogger();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Block Api"));
}

app.UseRouting().UseHttpMetrics().UseEndpoints(endpoints =>
{
    endpoints.MapGet("/ceiba/blockversion", () => new { version = 1.0, by = "Jose A. Fernandez" });
    endpoints.MapMetrics();
    endpoints.MapHealthChecks("/health");
});

using var scope = app.Services.GetService<IServiceScopeFactory>()?.CreateScope();
var contex = scope.ServiceProvider.GetRequiredService<PersistenceContext>();
var start = new Start(contex);
start.Inicializar();

app.UseHttpLogging();
app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();
app.Run();
