using System.Data;
using AutoMapper;
using Dapper;
using Domain.Ports;
using MediatR;

namespace Application.Person.Queries
{
    public class CellQueryHandler : IRequestHandler<CellQuery, List<CellDto>>
    {

        private readonly IDbConnection _dapperSource;
        private readonly IMapper _mapper;

        public CellQueryHandler(IDbConnection dapperSource, IMapper mapper)
        {
            _dapperSource = dapperSource;
            _mapper = mapper;
        }

        public async Task<List<CellDto>> Handle(CellQuery request, CancellationToken cancellationToken)
        {
            _ = request ?? throw new ArgumentNullException(nameof(request), "request object needed to handle this task");
            var query = (await _dapperSource.QueryAsync<Domain.Entities.Cell> ("select * from block.Cell")).ToList();            
            return _mapper.Map<List<CellDto>>(query);
        }

        
    }
}