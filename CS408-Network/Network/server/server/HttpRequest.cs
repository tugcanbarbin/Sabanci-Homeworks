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
    public class HttpRequest
    {
        String CRLF = "\r\n";
        int HTTP_PORT = 80;

        /** Store the request parameters */
        String method;
        String URI;
        String version;
        String headers = "";

        /** Server and port */
        private String host;
        private int port;

        //Socket clientSocket;

        /** Create HttpRequest by reading it from the client socket */
        public HttpRequest(Byte[] from)
        {
            /* TODO: Convert byte array "from" to string to process it.
         

             */

            string incomingMessage = Encoding.Default.GetString(from);  // stringe dönüştürücez
            incomingMessage = incomingMessage.Substring(0, incomingMessage.IndexOf("\0"));

            Console.WriteLine("Client: " + incomingMessage + "\n");// kutuya yazıcaz

            StringReader strReader = new StringReader(incomingMessage);

            /* TODO: Extract first line of the converted string. */
            String firstLine = "";
            try
            {
                firstLine = strReader.ReadLine();
            }
            catch (IOException e)
            {
                Console.WriteLine("Error reading request line: " + e);
            }


            /*
             TO DO: Split byte array and assign appropriate values to method, URI and version 
             */


            string[] subs = firstLine.Split(' ');

            method = subs[0];
            URI = subs[1];
            version = subs[2];


            Console.WriteLine("URI is: " + URI);
            if (method != "GET")
            {
                Console.WriteLine("Error: Method not GET");
            }

            try
            {
                String[] lines = incomingMessage.Split('\n'); //error will be gone when you do TODOs above
                foreach (string line in lines)
                {
                    headers += line + CRLF;
                    /* We need to find host header to know which server to
                    * contact in case the request URI is not complete. */


                    /*
                     * TO DO determine the Host and Port number 
                    */

                    if (line.StartsWith("Host:"))
                    {
                        host = line.Split(' ')[1];
                        port = HTTP_PORT;
                    }


                }
            }
            catch (IOException e)
            {
                Console.WriteLine("Error reading from socket: " + e);
                return;
            }
        }

        /** Return host for which this request is intended */
        public String getHost()
        {
            return host;
        }

        /** Return port for server */
        public int getPort()
        {
            return port;
        }
        /**
         * Convert request into a string for easy re-sending.
         */
        public String toString()
        {
            String req = "";

            //req = method + " " + URI + " " + version + CRLF;
            req += headers;
            /* This proxy does not support persistent connections */
            req += "Connection: close" + CRLF;
            req += CRLF;

            return req;
        }
    }
}
