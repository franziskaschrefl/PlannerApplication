using Microsoft.Extensions.Hosting;
using PlannerApplication_pureBlazor.Components;
using PlannerApplication_pureBlazor.Components.Pages;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();
builder.Services.AddSingleton<DataTransferObject, DataTransferObject>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();
bool dbStarted = PlannerCSharp.DataAccessLayer.Database.StartDB();
Console.WriteLine(dbStarted ? "Database started successfully" : "Database failed to start");
var lifetime = app.Services.GetRequiredService<IHostApplicationLifetime>();
lifetime.ApplicationStopping.Register(() => PlannerCSharp.DataAccessLayer.Database.StopDB());
app.Run();
//netstat -an | findstr 5432
