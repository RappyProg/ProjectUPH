# Pastikan sudah install Docker MySQL dan PhpMyAdmin
# Wajib dijalankan ketika menjalankan server Flask ini
# Sebelum menjalankan file ini pastikan sudah import Weplay.sql

from flask import *
from flask_mysqldb import MySQL
from PIL import Image
import base64
import io
from os import listdir

app = Flask(__name__)

#Konfigurasi MySQL
app.config['MYSQL_HOST'] = 'localhost'
#sesuaikan nama user dan password di komputer masing2
app.config['MYSQL_USER'] = 'weplay'
app.config['MYSQL_PASSWORD'] = 'Toko Komputer Masa Depan'
app.config['MYSQL_DB'] = 'weplay'
app.config['MYSQL_PORT'] = 3300
mysql = MySQL(app)  

def transaction_sql_clean(query):
    #fitur keamanan SQL Dasar. Menghapus karakter -- ; ' " untuk mencegah SQL Injection. Semoga berhasil
    for i in ['--',';',"'",'"','*']:
        query = query.replace(i,"")
    return '"' + query + '"'

@app.route('/')
def hello(): # TODO ubah menjadi render homepage @dhea
    cursor = mysql.connection.cursor()
    cursor.execute(''' SELECT * FROM transaksi''')
    transaksi = cursor.fetchone() # = desc limit 1
    print(type(transaksi)) #tipe data tuple
    
    return str(transaksi)

@app.route('/items/<item_name>')
def items(item_name):
    cursor = mysql.connection.cursor()
    item_name_clean = transaction_sql_clean(item_name)
    query = 'SELECT * FROM barang_dijual WHERE kode_barang = ' + item_name_clean
    cursor.execute(query)
    barang_dijual = cursor.fetchone() #Tips: Searching soal Python cursor fetchone dan fetchall
    
    #variabel pengganti untuk mempermudah
    label_barang_dijual = ['nama_barang', 'kode_barang', 'harga', 'stok', 'diskon_harga', 'deskripsi']
    #NOTE diskon harga maksudnya berapa harga yg dikurangi dari harga asli, cth harga 100rb diskon harga 25rb harganya jd 75rb. Bila diskon harga 0 tidak msk ke promos

    temp_dict = dict()
    for i in range(0,len(label_barang_dijual)): #utk mempermudah penyambungan ke front end
        temp_dict[label_barang_dijual[i]] = barang_dijual[i]

    print(temp_dict)

    #Ref: https://buraksenol.medium.com/pass-images-to-html-without-saving-them-as-files-using-python-flask-b055f29908a

    #build my own ver
    img_folder_path = str("product_img/"+item_name_clean.strip('"'))
    img_folder = listdir(img_folder_path)
    img_list = []
    for img_file in img_folder:
        print(img_folder_path + "/" + img_file)
        img = Image.open(img_folder_path + "/" + img_file)

        img_data = io.BytesIO()
        img.save(img_data,"JPEG")
        encoded_img_data = (base64.b64encode(img_data.getvalue())).decode('utf-8')
        img_list.append(encoded_img_data)

    print(temp_dict) #tes
    return render_template('frontend3.html', data=temp_dict, imgs = img_list, img_len = len(img_list))

if __name__=='__main__':
    app.run(port=7970, debug=True)
