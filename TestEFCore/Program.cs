using System;
using System.Collections.Generic;
using System.Linq;
using TestEFCore.Model;

namespace TestEFCore
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!!!! these are the EF Core errors . . .");


            var idsProfile = new List<long>() { 1 };

            var bd = new bdTestEFCoreContext();
            var modules = bd.Module
            .Where
            (m => m.Option
                   .Any(o => o.ProfileOption
                              .Any(po => idsProfile.Contains(po.ProfileId))
                       )
            )
            .Select(m => new Module
            {
                Name = m.Name,
                Icon = m.Icon,
                Option = bd.ProfileOption
                            .Where
                            (po => idsProfile.Contains(po.ProfileId) &&
                                   po.Option.ModuleId == m.Id
                            )
                            .Select(po => new Option
                            {
                                Name = po.Option.Name,
                                Icon = po.Option.Icon,
                                Url = po.Option.Url
                            })
                            .OrderBy(po => po.ListOrder) //order Option by ListOrder (1)
                            .ToList()

                            //the query of options did not apply the ordering by ListOrder (1):

                            //exec sp_executesql N'SELECT [po.Option].[Name], [po.Option].[Icon], [po.Option].[Url]
                            //FROM[Security].[ProfileOption] AS[po0]
                            //INNER JOIN[Security].[Option] AS[po.Option] ON[po0].[OptionId] = [po.Option].[Id]
                            //WHERE[po0].[ProfileId] IN(CAST(1 AS bigint)) AND([po.Option].[ModuleId] = @_outer_Id)',N'@_outer_Id bigint',@_outer_Id=1

            })
            .OrderBy(m => m.Priority) // order module by Priority (2)
            .ToList();

            //the query of modules did not apply the ordering by Priority (2):

            // SELECT[m].[Name], [m].[Icon], [m].[Id]
            // FROM[Security].[Module]
            // AS[m]
            //WHERE EXISTS(
            //    SELECT 1

            //    FROM[Security].[Option] AS [o]
            //    WHERE EXISTS (
            //        SELECT 1

            //        FROM[Security].[ProfileOption] AS [po]
            //        WHERE [po].[ProfileId] IN (CAST(1 AS bigint)) AND([o].[Id] = [po].[OptionId])) AND([m].[Id] = [o].[ModuleId]))

            //

            //NOTE:
            //these script are the ones reviewed in sql server profiler
        }
    }
}
