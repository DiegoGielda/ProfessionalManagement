<h1>ProfessionalManagement</h1>

<p>The purpose of this software is to provide a simple and fast way to manage personal growth in money and focus.</p>
<h2>Running the demo</h2>

<ul>
  <h3><li>1° Go to directory "<strong>System</strong>".</li></h3>
<hr/>
  <h3><li>2° Configure the file correctly "<strong>Config.ini</strong>".</li></h3>

  <h3>Connection to the database: <strong>ProfessionalManagementConnection</strong></h3>
  <p><strong>database=</strong> indicating the path where the database is located.</p>
  <p><strong>user_name=</strong> indicating the database user, usually by default "SYSDBA".</p>
  <p><strong>password=</strong> indicating the password of the user who is accessing the database, normally by default "masterkey".</p>
  <p><strong>fbclient=</strong> indicating the location of the firebird dll being it the "fbclient.dll".</p>

  <h3>Save attachments and other files as an image: <strong>ProfessionalManagementAttachment</strong></h3>
  <p><strong>attachment_path=</strong> path to save or query existing files belonging to releases.</p>
  <p><strong>attachment_detach_path=</strong> path to save or query existing files where they are separate files (do not belong to a record only to a group).</p>

  <h3>Configuration example:</h3>
  
  ```
  [ProfessionalManagementConnection]
  database=C:\ProfessionalManagement\Database\Development.FDB
  user_name=SYSDBA
  password=masterkey
  fbclient=C:\ProfessionalManagement\Database\fbclient.dll
  
  [ProfessionalManagementAttachment]
  attachment_path=C:\ProfessionalManagement\Database\Attachment\Record\
  attachment_detach_path=C:\ProfessionalManagement\Database\Attachment\Detached\
  ```
<hr/>
  <h3><li>3° Execute .exe from this directory.</li></h3>
  <h3><li>4° To carry out code modifications or Debug/Release readme "Readme.dev.txt"</li></h3>
</ul>
<br/>
<br/>
<br/>


<p>Documentação em Português</p>
<hr/>
<h1>Gerenciamento Profissional</h1>

<p>O objetivo deste software é proporcionar uma forma simples e rápida de gerenciar o crescimento pessoal em dinheiro e foco.</p>
<h2>Exexução do demo</h2>

<ul>
  <h3><li>1° Vá ao diretório "<strong>System</strong>".</li></h3>
<hr/>
  <h3><li>2° Configure corretamente o aquivo "<strong>Config.ini</strong>".</li></h3>

  <h3>Conexão com o banco de dados: <strong>ProfessionalManagementConnection</strong></h3>
  <p><strong>database=</strong> indicando o caminho que o banco de dados se encontra.</p>
  <p><strong>user_name=</strong> indicando o usuário do banco de dados, normalmente como padrão "SYSDBA".</p>
  <p><strong>password=</strong> indicando a senha do usuário que esta acessando o banco de dados, normalmente como padrão "masterkey".</p>
  <p><strong>fbclient=</strong> indicando o local da dll do firebird sendo ela "fbclient.dll".</p>

  <h3>Salvar anexos e outros arquivos como imagens: <strong>ProfessionalManagementAttachment</strong></h3>
  <p><strong>attachment_path=</strong> caminho para salvar ou consultar arquivos já existentes pertencentes aos lançamentos.</p>
  <p><strong>attachment_detach_path=</strong> caminho para salvar ou consultar arquivos já existentes onde são aquivos avulsos (não pertencem a um registro somente a um grupo).</p>

  <h3>Exemplo de configuração:</h3>
  
  ``` aadf
  [ProfessionalManagementConnection]
  database=C:\ProfessionalManagement\Database\Development.FDB
  user_name=SYSDBA
  password=masterkey
  fbclient=C:\ProfessionalManagement\Database\fbclient.dll
  
  [ProfessionalManagementAttachment]
  attachment_path=C:\ProfessionalManagement\Database\Attachment\Record\
  attachment_detach_path=C:\ProfessionalManagement\Database\Attachment\Detached\
  ```
<hr/>
  <h3><li>3° Executar o .exe deste diretório.</li></h3>
  <h3><li>4° Para realizar modificações de código ou depuração Debug/Release leia "Readme.dev.txt"</li></h3>  
</ul>
