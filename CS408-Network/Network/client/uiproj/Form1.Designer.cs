namespace uiproj
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.requestinput = new System.Windows.Forms.RichTextBox();
            this.portlabel = new System.Windows.Forms.Label();
            this.portinput = new System.Windows.Forms.TextBox();
            this.responseoutput = new System.Windows.Forms.RichTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.sendbutton = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // requestinput
            // 
            this.requestinput.Location = new System.Drawing.Point(23, 106);
            this.requestinput.Name = "requestinput";
            this.requestinput.Size = new System.Drawing.Size(260, 210);
            this.requestinput.TabIndex = 0;
            this.requestinput.Text = "";
            // 
            // portlabel
            // 
            this.portlabel.AutoSize = true;
            this.portlabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.portlabel.Location = new System.Drawing.Point(19, 27);
            this.portlabel.Name = "portlabel";
            this.portlabel.Size = new System.Drawing.Size(48, 24);
            this.portlabel.TabIndex = 1;
            this.portlabel.Text = "Port:";
            // 
            // portinput
            // 
            this.portinput.Location = new System.Drawing.Point(64, 32);
            this.portinput.Name = "portinput";
            this.portinput.Size = new System.Drawing.Size(209, 20);
            this.portinput.TabIndex = 2;
            // 
            // responseoutput
            // 
            this.responseoutput.Location = new System.Drawing.Point(341, 51);
            this.responseoutput.Name = "responseoutput";
            this.responseoutput.ReadOnly = true;
            this.responseoutput.Size = new System.Drawing.Size(214, 362);
            this.responseoutput.TabIndex = 3;
            this.responseoutput.Text = "";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(115, 78);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(92, 25);
            this.label1.TabIndex = 4;
            this.label1.Text = "Request";
            // 
            // sendbutton
            // 
            this.sendbutton.Location = new System.Drawing.Point(86, 346);
            this.sendbutton.Name = "sendbutton";
            this.sendbutton.Size = new System.Drawing.Size(134, 39);
            this.sendbutton.TabIndex = 5;
            this.sendbutton.Text = "Send Request";
            this.sendbutton.UseVisualStyleBackColor = true;
            this.sendbutton.Click += new System.EventHandler(this.sendbutton_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label2.Location = new System.Drawing.Point(402, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(109, 25);
            this.label2.TabIndex = 6;
            this.label2.Text = "Response";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(582, 443);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.sendbutton);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.responseoutput);
            this.Controls.Add(this.portinput);
            this.Controls.Add(this.portlabel);
            this.Controls.Add(this.requestinput);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RichTextBox requestinput;
        private System.Windows.Forms.Label portlabel;
        private System.Windows.Forms.TextBox portinput;
        private System.Windows.Forms.RichTextBox responseoutput;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button sendbutton;
        private System.Windows.Forms.Label label2;
    }
}

