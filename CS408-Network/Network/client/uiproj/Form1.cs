using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace uiproj
{
    public partial class Form1 : Form
    {
        //bool terminating = false;
        //bool connected = false;
        Socket clientSocket;
        bool connected = false;
        static int BUF_SIZE = 8192;

        public Form1()
        {
            Control.CheckForIllegalCrossThreadCalls = false;
            this.FormClosing += new FormClosingEventHandler(Form1_FormClosing);
            InitializeComponent();
        }
        private void Form1_FormClosing(object sender, EventArgs e)
        {
            connected = false;
            //terminating = true;
            Environment.Exit(0);
        }
        private void sendbutton_Click(object sender, EventArgs e)
        {
            string message = requestinput.Text;
            clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            IPHostEntry host = Dns.GetHostEntry("localhost");
            IPAddress ip = host.AddressList[1];

            //String ip = "localhost";

            int portNum;

             if (Int32.TryParse(portinput.Text, out portNum))
             {
                 try
                 {
                     clientSocket.Connect(ip, portNum);
                    //connected = true;

                    if (message != "")
                     {
                        Console.WriteLine(message);
                        Byte[] buffer = new Byte[BUF_SIZE];
                         buffer = Encoding.Default.GetBytes(message);
                         clientSocket.Send(buffer);
                        connected = true;
                     }
                    while (connected)
                    {
                        try
                        {
                            Byte[] buffer = new Byte[BUF_SIZE];
                            Console.Write("hello there");
                            clientSocket.Receive(buffer);
                            Console.Write("hello there2");

                            Console.Write(buffer);
                            string incomingMessage = Encoding.Default.GetString(buffer);
                            incomingMessage = incomingMessage.Substring(0, incomingMessage.IndexOf("\0"));
                            responseoutput.AppendText(incomingMessage);
                            connected = false;
                        }
                        catch
                        {
                            Console.Write("inside rec");
                            //clientSocket.Close();
                            //connected = false;
                        }
                    }
                }
                 catch
                 {
                     responseoutput.AppendText("could not connect to the server\n");
                 }
             }
             else
             {
                 responseoutput.AppendText("check the port\n");
             }
             clientSocket.Close();

        }
        //private void Receive()
        //{
            
        //}
    }
}
