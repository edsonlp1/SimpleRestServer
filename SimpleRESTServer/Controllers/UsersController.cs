using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SimpleRESTServer.Models;

namespace SimpleRESTServer.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly UserContext _context;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="context"></param>
        public UsersController(UserContext context)
        {
            _context = context;
        }


        /// <summary>
        /// Method GET that returns a list of Users.
        /// GET: api/users/getall
        /// </summary>
        /// <returns>List of Users</returns>
        [HttpGet]
        [Route("getall")]
        public IEnumerable<User> GetAll()
        {
            return _context.User.ToList();
        }


        /// <summary>
        /// Method GET that returns a User object given it's ID number
        /// GET: api/users/get/1
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{id}")]
        [Route("get")]
        public async Task<IActionResult> GetUser([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = await _context.User.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return Ok(user);
        }


        /// <summary>
        /// Method PUT that updates an User given it's ID number.
        /// PUT: api/users/update/1
        /// </summary>
        /// <param name="id">ID</param>
        /// <param name="user">Json User</param>
        /// <returns>User</returns>
        [HttpPut("{id}")]
        [Route("update")]
        public async Task<IActionResult> PutUser([FromRoute] int id, [FromBody] User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != user.ID)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        
        /// <summary>
        /// Creates a new User and return the new ID assigned
        /// If the user already exists on database, return error.
        /// POST: api/users/create/(user)
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("create")]
        public async Task<IActionResult> PostUser([FromBody] User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            else
            {
                var dbUser = from t in _context.User.Include("user")
                            where t.Name == user.Name
                            select t;

                if (dbUser.Count() > 0)
                {
                    return BadRequest("User already exists");
                }
                else
                {

                    _context.User.Add(user);
                    await _context.SaveChangesAsync();

                    return CreatedAtAction("GetUser", new { id = user.ID }, user);
                }
            }

        }

        
        /// <summary>
        /// Removes User object from database given it's ID
        /// DELETE: api/users/remove/1
        /// </summary>
        /// <param name="id">ID Number</param>
        /// <returns>OK</returns>
        [HttpDelete("{id}")]
        [Route("remove")]
        public async Task<IActionResult> DeleteUser([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = await _context.User.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.User.Remove(user);
            await _context.SaveChangesAsync();

            return Ok(user);
        }

        /// <summary>
        /// Check if User exists on database
        /// </summary>
        /// <param name="id">ID numer</param>
        /// <returns>True if exists user</returns>
        private bool UserExists(int id)
        {
            return _context.User.Any(e => e.ID == id);
        }
    }
}