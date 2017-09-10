using ManagementSystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManagementSystem.Business.Repository
{

    public class ReviewRepository
    {
        private ManagementSystemEntities _dbContext;
        public ReviewRepository()
        {
            _dbContext = new ManagementSystemEntities();
        }
        public List<Review> GetEReviewByEmployeeId(int employeeId)
        {
            var reviews = _dbContext.Reviews.Where(x => x.EmployeeId == employeeId).ToList();
            return reviews;
        }
        public List<Review> GetEReviewByDate(DateTime date)
        {
            var reviews = _dbContext.Reviews.Where(x => x.DateIssued == date).ToList();
            return reviews;
        }
        public List<Review> GetReviewsOrderedByDate()
        {
            var reviews = _dbContext.Reviews.OrderBy(x => x.DateIssued).ToList();
            return reviews;
        }
        public List<Review> GetReviewOrderedByWeight()
        {
            var reviews = _dbContext.Reviews.OrderBy(x => x.ReviewWeight).ToList();
            return reviews;
        }

    }
}
