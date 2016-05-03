using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;
using System.IO;
using System.Xml;
using Ionic.Zip;
using FirebirdSql.Data.FirebirdClient;
using System.Configuration;
using System.Globalization;
using System.Runtime.InteropServices;
using System.Diagnostics;


namespace EnviarSNGPC
{
    public partial class FrmEnviarSNGPC : Form
    {
        //Método da API
        [DllImport("wininet.dll")]
        private extern static Boolean InternetGetConnectedState(out int Description, int ReservedValue);

        // Um método que verifica se esta conectado
        public static Boolean IsConnected()
        {
            int Description;
            return InternetGetConnectedState(out Description, 0);
        }
        
        static FbTransaction transacao;
        static string comp;
        
        public FrmEnviarSNGPC()
        {
            InitializeComponent();
        }

        //PERMITIR APENAS NÚMEROS
        public static void AllowNumber(KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || //Letras
                char.IsSymbol(e.KeyChar) || //Símbolos
                char.IsWhiteSpace(e.KeyChar) || //Espaço
                char.IsPunctuation(e.KeyChar)) //Pontuação
                e.Handled = true; //Não permitir
            //Com o script acima é possível utilizar Números, 'Del', 'BackSpace'..

            //Abaixo só é permito de 0 a 9
            //if ((e.KeyChar < '0') || (e.KeyChar > '9')) e.Handled = true; //Allow only numbers
        }

        public string GetMd5Arquivo(string arquivo)
        {

            String md5Result;
            StringBuilder sb = new StringBuilder();
            MD5 md5Hasher = MD5.Create();

            using (FileStream fs = File.OpenRead(arquivo))
            {
                try
                {
                    foreach (Byte b in md5Hasher.ComputeHash(fs))
                        sb.Append(b.ToString("x2").ToLower());
                }
                finally
                {
                    fs.Close();
                }
            }

            md5Result = sb.ToString();

            return md5Result;
        }

        private void btnAbrir_Click(object sender, EventArgs e)
        {
            /*openFileDialog1.Reset();
            openFileDialog1.InitialDirectory = "C:\\INFOG2\\XML";*/

            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                
                System.IO.StreamReader sr = new
                   System.IO.StreamReader(openFileDialog1.FileName);
                txtArquivo.Text = openFileDialog1.FileName;
                //MessageBox.Show(sr.ReadToEnd());
                sr.Close();
                //
                button1_Click(sender, e);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String md5Result;
            StringBuilder sb = new StringBuilder();
            MD5 md5Hasher = MD5.Create();

            using (FileStream fs = File.OpenRead(txtArquivo.Text))
            {
                foreach (Byte b in md5Hasher.ComputeHash(fs))
                    sb.Append(b.ToString("x2").ToLower());
            }

            md5Result = sb.ToString();

            txtHash.Text = md5Result;
        }

        private void btnConsulta_Click(object sender, EventArgs e)
        {
            if (txtArquivo.Text == "")
            {
                MessageBox.Show("Selecione o arquivo a ser consultado.");
                btnAbrir.Focus();
                return;
            }

            btnConsulta.Enabled = false;
            btnCompactar.Enabled = false;
            txtEncoded.Text = "";
            slbMensagem.Text = "Aguarde, consultando arquivo...";
            
            try
            {
                string hashArquivo = GetMd5Arquivo(txtArquivo.Text);

                txtHash.Text = hashArquivo;

                int hambiente = GetHambiente();
                //
                try
                {
                    if (hambiente == 0)
                    {
                        ServiceReference1.sngpcSoapClient wssngpc = new ServiceReference1.sngpcSoapClient();

                        comp = wssngpc.ConsultaDadosArquivoSNGPC(txtEmail.Text, txtSenha.Text.TrimEnd(), txtCnpj.Text, txtHash.Text);
                    }
                     else {
                        Sngpc.sngpcSoapClient wssngpc = new Sngpc.sngpcSoapClient();

                        comp = wssngpc.ConsultaDadosArquivoSNGPC(txtEmail.Text, txtSenha.Text.TrimEnd(), txtCnpj.Text, txtHash.Text);
                    }

                    txtEncoded.Text = comp;

                    string dataValidacao = getBetween(comp, "<DATAVALIDACAO>", "</DATAVALIDACAO>");

                    if (dataValidacao != "")
                    { 
                        if (AtualizarDataUltimoArquivo(dataValidacao))
                        {
                            MessageBox.Show("Arquivo válidado com sucesso.");
                        }
                    }
                }
                catch (Exception err)
                {
                    MessageBox.Show("Ocorreu um problema ao tentar acessar serviço.");
                    MessageBox.Show(err.Message);
                }
            }
            finally
            {
                btnConsulta.Enabled = true;
                btnCompactar.Enabled = true;
                slbMensagem.Text = "";
            }
        }

        private void btnCompactar_Click(object sender, EventArgs e)
        {
            if (txtArquivo.Text == "")
            {
                MessageBox.Show("Selecione o arquivo a ser enviado.");
                btnAbrir.Focus();
                return;
            }

            if (MessageBox.Show("Confirma envio de arquivo para Anvisa?", 
                 "Enviar Arquivo para Anvisa", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.No)
                   return;

            txtEncoded.Text = "";
            // Apagar arquivo zip anterior
            if (System.IO.File.Exists(@"SNGPC01.zip"))
            {
                System.IO.File.Delete(("SNGPC01.zip")); 
            }


            using (ZipFile zip = new ZipFile())
            {
                zip.AddFile(txtArquivo.Text, "");
                //zip.AddDirectory(txtArquivo.Text, "Files");
                zip.Save("SNGPC01.zip");
                zip.Dispose();
            };

            MemoryStream ms = new MemoryStream();
            FileStream file = new FileStream("SNGPC01.zip", FileMode.Open, FileAccess.Read);
            byte[] bytes = new byte[file.Length];
            file.Read(bytes, 0, (int)file.Length);
            ms.Write(bytes, 0, (int)file.Length);
            //
            file.Read(bytes, 0, Convert.ToInt32(file.Length));
            string encodedData =
                Convert.ToBase64String(bytes,
                                       Base64FormattingOptions.InsertLineBreaks);
            //
            //txtEncoded.Text = encodedData;
            //
            file.Close();
            ms.Close();

            
            int hambiente = GetHambiente();
            btnCompactar.Enabled = false;
            btnConsulta.Enabled = false;
            //
            slbMensagem.Text = "Aguarde, transmitindo arquivo para anvisa...";

            try
            {
                try
                {
                    if (hambiente == 0)
                    {
                        ServiceReference1.sngpcSoapClient wssngpc = new ServiceReference1.sngpcSoapClient();

                        comp = wssngpc.EnviaArquivoSNGPC(txtEmail.Text, txtSenha.Text.TrimEnd(), bytes, lblHash.Text);
                    }
                    else
                    {
                        Sngpc.sngpcSoapClient wssngpc = new Sngpc.sngpcSoapClient();

                        comp = wssngpc.EnviaArquivoSNGPC(txtEmail.Text, txtSenha.Text.TrimEnd(), bytes, lblHash.Text);
                    }

                    txtEncoded.Text = comp;
                    //
                    AddArquivoGerado(txtArquivo.Text, txtHash.Text);
                }
                catch (Exception err)
                {
                    MessageBox.Show("Ocorreu um problema ao tentar acessar serviço.");
                    MessageBox.Show(err.Message);
                }
            }
            finally
            {
                btnCompactar.Enabled = true;
                btnConsulta.Enabled = true;
                slbMensagem.Text = "";
            }

        }


        private void txtCnpj_KeyPress(object sender, KeyPressEventArgs e)
        {
            AllowNumber(e); //Allow only
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            acessoFBSingleton();
            //
            OpenDadosFarmaceutico();
            //
            btnCompactar.Enabled = false;
            btnConsulta.Enabled = false;
            // Se a internet esta conectada
            if (IsConnected())
            {            
                btnCompactar.Enabled = true;
                btnConsulta.Enabled = true;
            }
            else
            {
                MessageBox.Show("Não exite conexão ativa com a internet.");
                slbMensagem.Text = "Não exite conexão ativa com a internet!!! Por favor vefivique sua conexão com a internet.";
            }
        }

        public void acessoFB()
        {
            string strConn = ConfigurationManager.ConnectionStrings["FireBirdConnectionString"].ToString();
            FbConnection fbConn = new FbConnection(strConn);

            FbCommand fbCmd = new FbCommand("Select * from CONFIG", fbConn);

            try
            {
                fbConn.Open();

                FbDataAdapter fbDa = new FbDataAdapter(fbCmd);
                DataTable dtEmployee = new DataTable();
                fbDa.Fill(dtEmployee);

               // dataGridView1.DataSource = dtEmployee;
            }
            catch (FbException fbex)
            {
                MessageBox.Show("Erro ao acessar o FireBird " + fbex.Message, "Erro");
            }
            finally
            {
                fbConn.Close();
            }
        }

        public void acessoFBSingleton()
        {
            
        }


        // Carregar dados do Farmaceutico
        private void OpenDadosFarmaceutico() 
        {
            string mSQL;

            using (FbConnection conexaoFireBird = daoFireBird.getInstancia().getConexao())
            {
                try
                {
                    conexaoFireBird.Open();

                    mSQL = "Select FAR_CODIGO, F.far_empresa, E.emp_cnpj, F.email, F.senha from FARMACEUTICOS F ";
                    mSQL = mSQL+ " inner JOIN EMPRESAS E ON F.far_empresa = E.emp_codigo where (F.FAR_CODIGO = 1) ";                   

                    FbCommand cmd = new FbCommand(mSQL, conexaoFireBird);
                    FbDataReader dtr2 = cmd.ExecuteReader();
                    dtr2.Read();

                    if (dtr2.HasRows)
                    {
                        txtEmail.Text = Convert.ToString(dtr2["email"]);
                        txtSenha.Text = Convert.ToString(dtr2["senha"]);
                        txtCnpj.Text = Convert.ToString(dtr2["emp_cnpj"]);
                        //
                        txtEmail.Text = txtEmail.Text.ToUpper();
                    }
                   
                }
                catch (FbException fbex)
                {
                    MessageBox.Show("Erro de acesso ao Firebird : " + fbex.Message, "Erro");
                }
                finally
                {
                    conexaoFireBird.Close();
                }
            }
        }

        // Atualiza data do último arquivo validado
        private Boolean AtualizarDataUltimoArquivo(string dataValidacao)
        {
            string mSQL;

            string strReplace = (dataValidacao).Replace("/", "");
            DateTime date1 = new DateTime(Convert.ToInt32(strReplace.Substring(4, 4)), Convert.ToInt32(strReplace.Substring(2, 2)), Convert.ToInt32(strReplace.Substring(0, 2)), 0, 0, 0);
            string dataConvertida = date1.ToString(CultureInfo.CreateSpecificCulture("pt-BR"));

            using (FbConnection conexaoFireBird = daoFireBird.getInstancia().getConexao())
            {
                                
                conexaoFireBird.Open();
                
                try
                {

                    transacao = conexaoFireBird.BeginTransaction(IsolationLevel.ReadCommitted);

                    mSQL = "Update CONFIG set CFG_DTULTIMO_ARQUIVO_VALIDADO = @data ";


                    FbCommand cmd = new FbCommand(mSQL, conexaoFireBird, transacao);
                    cmd.Parameters.AddWithValue("@data", dataConvertida);

                    cmd.ExecuteNonQuery();

                    transacao.Commit();  // commita a transação
                    transacao.Dispose();
                    transacao = null;
                    //                    
                    return true;                   

                }
                catch (FbException fbex)
                {
                    // Em caso de erros cancela (Rollback) a transação
                    transacao.Rollback();
                    //
                    MessageBox.Show("Erro de acesso ao Firebird : " + fbex.Message, "Erro");
                    return false;
                }
                finally
                {
                    conexaoFireBird.Close();
                }
            }
        }

        public static string getBetween(string strSource, string strStart, string strEnd)
        {
            int Start, End;
            if (strSource.Contains(strStart) && strSource.Contains(strEnd))
            {
                Start = strSource.IndexOf(strStart, 0) + strStart.Length;
                End = strSource.IndexOf(strEnd, Start);
                return strSource.Substring(Start, End - Start);
            }
            else
            {
                return "";
            }
        }

       // Adicionar md5 arquivo gerado
        private Boolean AddArquivoGerado(string arquivo, string _md5Arquivo) {

            string mSQL;
            string mSQL2;
            int codigo = GetCodigoArquivo();

            DateTime dt = DateTime.Now;

            string strReplace = (dt.ToString("dd/MM/yyyy").Replace("/", ""));
            DateTime date1 = new DateTime(Convert.ToInt32(strReplace.Substring(4, 4)), Convert.ToInt32(strReplace.Substring(2, 2)), Convert.ToInt32(strReplace.Substring(0, 2)), 0, 0, 0);
            string dataConvertida = date1.ToString(CultureInfo.CreateSpecificCulture("pt-BR"));

            DateTime hora = DateTime.Now;           

            using (FbConnection conexaoFireBird = daoFireBird.getInstancia().getConexao())
            {

                conexaoFireBird.Open();

                try
                {
                    codigo = codigo + 1;

                    transacao = conexaoFireBird.BeginTransaction(IsolationLevel.ReadCommitted);

                    mSQL = "INSERT INTO ARQUIVO_GERADO(ARQ_CODIGO, DATA_GERACAO, HORA_GERACAO, USUARIO, HASH_MD5, NOME_ARQUIVO) VALUES ";
                    mSQL = mSQL + "(@CODIGO, @DATA, @HORA, @USUARIO,@HASH_MD5, @NOME_ARQUIVO)";
                                        
                    FbCommand cmd = new FbCommand(mSQL, conexaoFireBird, transacao);
                    cmd.Parameters.AddWithValue("CODIGO", codigo);
                    cmd.Parameters.AddWithValue("DATA", dataConvertida);
                    cmd.Parameters.AddWithValue("HORA", hora.ToString("HH:mm:ss"));
                    cmd.Parameters.AddWithValue("USUARIO", 1);
                    cmd.Parameters.AddWithValue("HASH_MD5", _md5Arquivo);
                    cmd.Parameters.AddWithValue("NOME_ARQUIVO", arquivo);
                    
                    cmd.ExecuteNonQuery();

                    // tabela config
                    mSQL2 = "Update CONFIG set CFG_ARQUIVO_GERADO = @codigo ";

                    FbCommand cmd2 = new FbCommand(mSQL2, conexaoFireBird, transacao);
                    cmd2.Parameters.AddWithValue("@codigo", codigo);
                    cmd2.ExecuteNonQuery();

                    transacao.Commit();  // commita a transação
                    transacao.Dispose();
                    transacao = null;
                    //                    
                    return true;

                }
                catch (FbException fbex)
                {
                    // Em caso de erros cancela (Rollback) a transação
                    transacao.Rollback();
                    //
                    MessageBox.Show("Erro de acesso ao Firebird : " + fbex.Message, "Erro");
                    return false;
                }
                finally
                {
                    conexaoFireBird.Close();
                }
            }
        }

        // Get codigo arquivo
        private int GetCodigoArquivo()
        {
            string mSQL;

            using (FbConnection conexaoFireBird = daoFireBird.getInstancia().getConexao())
            {
                try
                {
                    conexaoFireBird.Open();

                    mSQL = "Select CFG_ARQUIVO_GERADO from CONFIG ";
                    

                    FbCommand cmd = new FbCommand(mSQL, conexaoFireBird);
                    FbDataReader dtr2 = cmd.ExecuteReader();
                    dtr2.Read();

                    if (dtr2.HasRows)
                    {
                        if (string.Equals(Convert.ToString(dtr2["CFG_ARQUIVO_GERADO"]), ""))
                        {
                            return 0;
                        }else
                        {
                            return Convert.ToInt32(dtr2["CFG_ARQUIVO_GERADO"]); 
                        }
                    }
                    else
                    {
                        return 0;
                    }

                }
                catch (FbException fbex)
                {
                    MessageBox.Show("Erro de acesso ao Firebird : " + fbex.Message, "Erro");
                    return 0;
                }
                finally
                {
                    conexaoFireBird.Close();
                }
            }
        }


        // Get Hambiente
        private int GetHambiente()
        {
            string mSQL;

            using (FbConnection conexaoFireBird = daoFireBird.getInstancia().getConexao())
            {
                try
                {
                    conexaoFireBird.Open();

                    mSQL = "Select CFG_FLPRODUCAO from CONFIG ";


                    FbCommand cmd = new FbCommand(mSQL, conexaoFireBird);
                    FbDataReader dtr2 = cmd.ExecuteReader();
                    dtr2.Read();

                    if (dtr2.HasRows)
                    {
                        if (string.Equals(Convert.ToString(dtr2["CFG_FLPRODUCAO"]), ""))
                        {
                            return 0;
                        }
                        else
                        {
                            return Convert.ToInt32(dtr2["CFG_FLPRODUCAO"]);
                        }
                    }
                    else
                    {
                        return 0;
                    }

                }
                catch (FbException fbex)
                {
                    MessageBox.Show("Erro de acesso ao Firebird : " + fbex.Message, "Erro");
                    return 0;
                }
                finally
                {
                    conexaoFireBird.Close();
                }
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {

        }

       
       
    }
}
