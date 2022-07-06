using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace projetest
{
    class Program
    {
        /** Port for the proxy */
        private static int port;
        /** Socket for client connections */
        private static Socket socket;
        static int BUF_SIZE = 8192;

        /** Create new socket object*/
        public static void init(int p)
        {
            port = p;
            try
            {
                /* TODO: Create endpoint, socket then bind and start listening for connections

                 */

                
                IPHostEntry host = Dns.GetHostEntry("localhost");
                IPAddress ipAddress = host.AddressList[1];
                IPEndPoint localEndPoint = new IPEndPoint(ipAddress, port);

                socket = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

                //Console.Write(host.AddressList[1]);

                socket.Bind(localEndPoint);

                socket.Listen(3); 

            }
            catch (IOException e)
            {
                Console.WriteLine("Error creating socket: " + e);
                return;
            }
        }

        public static void handle(Socket client)
        {
            Socket server = null;

            HttpRequest request = null;
            HttpResponse response = null;

            IPEndPoint endPoint = new IPEndPoint(IPAddress.Any, port);

            /* Process request. If there are any exceptions, then simply
             * return and end this thread. This unfortunately means the
             * client will hang for a while, until it timeouts. */

            /* Read request */
            try
            {
                /* TODO: Receive request text from client by using buffer as always (client socket sent as parameter to the function from main)

                 */
                Byte[] buffer = new Byte[BUF_SIZE];  // byte olarak alıcaz
                client.Receive(buffer);  // byte olarak alıcaz
                //string incomingMessage = Encoding.Default.GetString(buffer);  // stringe dönüştürücez
               // incomingMessage = incomingMessage.Substring(0, incomingMessage.IndexOf("\0"));
               // Console.WriteLine("Client: " + incomingMessage + "\n");// kutuya yazıcaz

                request = new HttpRequest(buffer); //TODO: error will be gone when you create request object with buffer created above.
                Console.WriteLine("Got request...");
            }
            catch (IOException e)
            {
                Console.WriteLine("Error reading request from client: " + e);
                return;
            }

            /* Send request to web page */
            try
            {
                /* TODO: create new socket to "server" socket (server = new..) and connect to the host with determined port with this socket (Hint:use HttpRequest getHost() and getPort())
                 * then send request which is HttpRequest object now through the server socket (hint: use toString() for string buffer conversion setup for socket communication.
                
                 */
                var hostStr = request.getHost();
                IPHostEntry host = Dns.GetHostEntry(hostStr);
                IPAddress ipAddress = host.AddressList[0];
                var port = request.getPort();
                IPEndPoint localEndPoint = new IPEndPoint(ipAddress, port);

                server = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
                //server.Bind(localEndPoint);

                //server.Listen(3);

                String msg = request.toString();

                String[] bannedList = { "Cow", "Camel", "Sabancı", "Sabanci", "sabanci", "sabancı"};


                bool isBanned = false;
                foreach(String banned in bannedList)
                {
                    if (msg.Contains(banned))
                    {
                        isBanned = true;
                    }
                }

                if (isBanned)
                {
                    Byte[] buffer = new Byte[BUF_SIZE];
                    buffer = Encoding.Default.GetBytes("Bad request!");
                    Console.Write(buffer);
                    client.Send(buffer);
                    return;
                }
                else
                {
                    Byte[] buffer = new Byte[BUF_SIZE];
                    buffer = Encoding.Default.GetBytes(msg);

                    server.Connect(localEndPoint);

                    server.Send(buffer);
                }
               

            }
            catch (IOException e)
            {
                Console.WriteLine("Error writing request to server: " + e);
                return;
            }

            /* Read response and forward it to client */
            try
            {
                /*TODO: Create new buffer, receive response from host using server socket, convert it to HttpResponse object (response = new...), 
                * then send it to client with "client" socket (hint: HttpResponse's toString function for converting response to string.

                 */

                Byte[] buffer = new Byte[BUF_SIZE];  // byte olarak alıcaz
                server.Receive(buffer);  // byte olarak alıcaz

                response = new HttpResponse(buffer);

                String resMsg = response.toString();
                Console.Write(resMsg + " 4 ");
                Byte[] buffer2 = new Byte[BUF_SIZE];
                buffer2 = Encoding.Default.GetBytes(resMsg);
                client.Send(buffer2);

                client.Close();
                server.Close();
            }
            catch (IOException e)
            {
                Console.WriteLine("Error writing response to client: " + e);
            }
        }

        /** Get input from command prompt and start server */
        public static void Main(string[] args)
        {
            int myPort = 0;
            string val;
            Console.Write("Enter port: ");
            val = Console.ReadLine();

            /* TODO: Parse port to integer 
             
            
            */

            Int32.TryParse(val, out myPort);


            init(myPort);

            /** Main loop. Listen for incoming connections and spawn a new thread for handling them */
            Socket client = null;

            while (true)
            {
                try
                {
                    client = socket.Accept();
                    Console.WriteLine("Got connection " + client);
                    /* TODO: Create and start threads with function "handle" for receiving clients at the same time

                     */

                    Thread t = new Thread(() => handle(client));
                    t.Start();


                }
                catch (IOException e)
                {
                    Console.WriteLine("Error reading request from client: " + e);
                    /* Definitely cannot continue, so skip to next
                        * iteration of while loop. */
                    continue;
                }
            }

        }
    }
}
