﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace projetest
{
    class HttpResponse
    {
        static String CRLF = "\r\n";
        /** How big is the buffer used for reading the object */
        static int BUF_SIZE = 8192;
        /** Maximum size of objects that this proxy can handle. For the
         * moment set to 100 KB */
        static int MAX_OBJECT_SIZE = 100000;
        /** Reply status and headers */
        String version;
        int status;
        String statusLine = "";
        String headers = "";
        /* Body of reply */
        byte[] body = new byte[MAX_OBJECT_SIZE];

        /** Read response from server. */
        public HttpResponse(Byte[] fromServer)
        {
            /* Length of the object */
            int length = -1;
            bool gotStatusLine = false;

            string incomingMessage = Encoding.Default.GetString(fromServer);  // stringe dönüştürücez
            try
            {
                incomingMessage = incomingMessage.Substring(0, incomingMessage.IndexOf("\0"));
            }
            catch
            {
                incomingMessage = Encoding.Default.GetString(fromServer);
            }

            /* First read status line and response headers */
            try
            {
                String[] lines = incomingMessage.Split('\n');

                /*
                 * TO-DO A loop to Determine the status code and length (according to content header length filed)
                 */

                for (int i = 0; i < lines.Length; i++)
                {
                    String line = lines[i];

                    Console.WriteLine("1: " + line);

                    if (!gotStatusLine)
                    {
                        statusLine = line;
                        gotStatusLine = true;
                        Console.WriteLine("2: " + statusLine);

                    }
                    else
                    {
                        headers += line + CRLF;
                        Console.WriteLine("3: " + headers);

                    }

                    if (line.StartsWith("Content-Length:") || line.StartsWith("Content-length:"))
                    {
                        String[] tmp = line.Split(' ');
                        length = Int32.Parse(tmp[1]);
                    }
                }

            }
            catch (IOException e)
            {
                Console.WriteLine("Error reading headers from server: " + e);
                return;
            }

            try
            {
                int bytesRead = 0;
                Byte[] buf = new Byte[BUF_SIZE];
                bool loop = false;

                /* If we didn't get Content-Length header, just loop until
                 * the connection is closed. */
                if (length == -1)
                {
                    loop = true;
                }
                /* Read the body in chunks of BUF_SIZE and copy the chunk
                 * into body. Usually replies come back in smaller chunks
                 * than BUF_SIZE. The while-loop ends when either we have
                 * read Content-Length bytes or when the connection is
                 * closed (when there is no Connection-Length in the
                 * response. */
                while (bytesRead < length || loop)
                {
                    /* Read it in as binary data */
                    int res = fromServer.Length;

                    Console.Write(res);
                    //int res = is.read(buf, 0, BUF_SIZE);
                    if (res == -1)
                    {
                        break;
                    }
                    /* Copy the bytes into body. Make sure we don't exceed
                     * the maximum object size. */
                    for (int i = 0;
                         i < res && (i + bytesRead) < MAX_OBJECT_SIZE;
                         i++)
                    {
                        body[bytesRead + i] = buf[i];
                    }
                    bytesRead += res;
                }
            }
            catch (IOException e)
            {
                Console.WriteLine("Error reading response body: " + e);
                return;
            }


        }
        /**
        * Convert response into a string for easy re-sending. Only
        * converts the response headers, body is not converted to a
        * string.
        */
        public String toString()
        {
            String res = "";

            res = statusLine + CRLF;
            res += headers;
            res += CRLF;
            Console.WriteLine("5: " + res);

            return res;
        }
    }
}
