﻿using FluentValidation;
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using System.Reflection;

namespace Cart.Application
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services)
        {
            services.AddAutoMapper(Assembly.GetExecutingAssembly())
                .AddMediatR(Assembly.GetExecutingAssembly())
                .AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
            return services;
        }
    }
}
