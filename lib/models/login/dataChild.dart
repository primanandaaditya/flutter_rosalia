
class Data {
  String memberUrut;
  String namaMember;
  String memberId;
  String noTelp;
  String email;
  Null transaksiPertama;
  String alamat;
  String saldoPoin;
  String keterangan;
  String tglLahirMember;
  String identitasMember;
  Null tglSheet;
  String tempatPendaftaran;
  String tanggalDaftar;
  String nomorLama;
  String kecamatan;
  String kabupaten;
  String asalAgen;
  Null tanggalPembayaran;
  Null tempatPembayaran;
  String keteranganKartu;
  String password;
  String agama;
  String tempatLahir;
  String kelurahan;
  String rT;
  String rW;
  String kodepos;
  String sebutan;
  String approved;
  String jenisKelamin;
  Null terimaIklan;
  String flagHapus;
  Null keteranganCetak;
  String agenId;
  String punyaKartu;
  Null tglCetakKartuTerakhir;
  String browserMember;
  String osMember;
  String ipMember;
  String approveUltah;
  Null photos;
  Null idLama;

  Data(
      {this.memberUrut,
      this.namaMember,
      this.memberId,
      this.noTelp,
      this.email,
      this.transaksiPertama,
      this.alamat,
      this.saldoPoin,
      this.keterangan,
      this.tglLahirMember,
      this.identitasMember,
      this.tglSheet,
      this.tempatPendaftaran,
      this.tanggalDaftar,
      this.nomorLama,
      this.kecamatan,
      this.kabupaten,
      this.asalAgen,
      this.tanggalPembayaran,
      this.tempatPembayaran,
      this.keteranganKartu,
      this.password,
      this.agama,
      this.tempatLahir,
      this.kelurahan,
      this.rT,
      this.rW,
      this.kodepos,
      this.sebutan,
      this.approved,
      this.jenisKelamin,
      this.terimaIklan,
      this.flagHapus,
      this.keteranganCetak,
      this.agenId,
      this.punyaKartu,
      this.tglCetakKartuTerakhir,
      this.browserMember,
      this.osMember,
      this.ipMember,
      this.approveUltah,
      this.photos,
      this.idLama});

  Data.fromJson(Map<String, dynamic> json) {
    memberUrut = json['member_urut'];
    namaMember = json['nama_member'];
    memberId = json['member_id'];
    noTelp = json['no_telp'];
    email = json['email'];
    transaksiPertama = json['transaksi_pertama'];
    alamat = json['alamat'];
    saldoPoin = json['saldo_poin'];
    keterangan = json['keterangan'];
    tglLahirMember = json['tgl_lahir_member'];
    identitasMember = json['identitas_member'];
    tglSheet = json['tgl_sheet'];
    tempatPendaftaran = json['tempat_pendaftaran'];
    tanggalDaftar = json['tanggal_daftar'];
    nomorLama = json['nomor_lama'];
    kecamatan = json['kecamatan'];
    kabupaten = json['kabupaten'];
    asalAgen = json['asal_agen'];
    tanggalPembayaran = json['tanggal_pembayaran'];
    tempatPembayaran = json['tempat_pembayaran'];
    keteranganKartu = json['keterangan_kartu'];
    password = json['password'];
    agama = json['agama'];
    tempatLahir = json['tempat_lahir'];
    kelurahan = json['kelurahan'];
    rT = json['RT'];
    rW = json['RW'];
    kodepos = json['Kodepos'];
    sebutan = json['Sebutan'];
    approved = json['Approved'];
    jenisKelamin = json['Jenis_kelamin'];
    terimaIklan = json['terima_iklan'];
    flagHapus = json['flag_hapus'];
    keteranganCetak = json['keterangan_cetak'];
    agenId = json['agen_id'];
    punyaKartu = json['punya_kartu'];
    tglCetakKartuTerakhir = json['tgl_cetak_kartu_terakhir'];
    browserMember = json['browser_member'];
    osMember = json['os_member'];
    ipMember = json['ip_member'];
    approveUltah = json['approve_ultah'];
    photos = json['photos'];
    idLama = json['id_lama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_urut'] = this.memberUrut;
    data['nama_member'] = this.namaMember;
    data['member_id'] = this.memberId;
    data['no_telp'] = this.noTelp;
    data['email'] = this.email;
    data['transaksi_pertama'] = this.transaksiPertama;
    data['alamat'] = this.alamat;
    data['saldo_poin'] = this.saldoPoin;
    data['keterangan'] = this.keterangan;
    data['tgl_lahir_member'] = this.tglLahirMember;
    data['identitas_member'] = this.identitasMember;
    data['tgl_sheet'] = this.tglSheet;
    data['tempat_pendaftaran'] = this.tempatPendaftaran;
    data['tanggal_daftar'] = this.tanggalDaftar;
    data['nomor_lama'] = this.nomorLama;
    data['kecamatan'] = this.kecamatan;
    data['kabupaten'] = this.kabupaten;
    data['asal_agen'] = this.asalAgen;
    data['tanggal_pembayaran'] = this.tanggalPembayaran;
    data['tempat_pembayaran'] = this.tempatPembayaran;
    data['keterangan_kartu'] = this.keteranganKartu;
    data['password'] = this.password;
    data['agama'] = this.agama;
    data['tempat_lahir'] = this.tempatLahir;
    data['kelurahan'] = this.kelurahan;
    data['RT'] = this.rT;
    data['RW'] = this.rW;
    data['Kodepos'] = this.kodepos;
    data['Sebutan'] = this.sebutan;
    data['Approved'] = this.approved;
    data['Jenis_kelamin'] = this.jenisKelamin;
    data['terima_iklan'] = this.terimaIklan;
    data['flag_hapus'] = this.flagHapus;
    data['keterangan_cetak'] = this.keteranganCetak;
    data['agen_id'] = this.agenId;
    data['punya_kartu'] = this.punyaKartu;
    data['tgl_cetak_kartu_terakhir'] = this.tglCetakKartuTerakhir;
    data['browser_member'] = this.browserMember;
    data['os_member'] = this.osMember;
    data['ip_member'] = this.ipMember;
    data['approve_ultah'] = this.approveUltah;
    data['photos'] = this.photos;
    data['id_lama'] = this.idLama;
    return data;
  }
}