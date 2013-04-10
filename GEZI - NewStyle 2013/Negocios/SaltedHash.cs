using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using Datos;
using Entidades;

namespace Negocios
{
    public class SaltedHash
    {
        public string Hash { get; private set; }

        public string Salt { get; private set; }

        public SaltedHash(string password)
        {
            var saltBytes = new byte[32];
            using (var provider = RandomNumberGenerator.Create())
            {
                provider.GetNonZeroBytes(saltBytes);
            }
            Salt = Convert.ToBase64String(saltBytes);
            var passwordAndSaltBytes = Concat(password, saltBytes);
            Hash = ComputeHash(passwordAndSaltBytes);
        }

        private static string ComputeHash(byte[] bytes)
        {
            using (var sha256 = SHA256.Create())
            {
                return Convert.ToBase64String(sha256.ComputeHash(bytes));
            }
        }

        private static byte[] Concat(string password, byte[] saltBytes)
        {
            var passwordBytes = Encoding.UTF8.GetBytes(password);
            return passwordBytes.Concat(saltBytes).ToArray();
        }

        public static Usuario_Entidad VerificaUsuario(string username)
        {
            Usuarios_Dato ud = new Usuarios_Dato();

            return ud.VerificaUsuario(username);
        }

        public static bool Verify(string salt, string hash, string password)
        {
            var saltBytes = Convert.FromBase64String(salt);
            var passwordAndSaltBytes = Concat(password, saltBytes);
            var hashAttempt = ComputeHash(passwordAndSaltBytes);
            return hash == hashAttempt;
        }
    }
}