class Student {
  final String idCard;
  final String nis;
  final String name;
  final String kelas;
  final String photoAsset; // path ke aset foto

  Student({
    required this.idCard,
    required this.nis,
    required this.name,
    required this.kelas,
    required this.photoAsset,
  });
}

final Map<String, Student> students = {
  '3355442596': Student(
    idCard: '3355442596',
    nis: 'S001',
    name: 'Lili Sugiyanti',
    kelas: '10-A',
    photoAsset: 'assets/students/1.jpg',
  ),
  '3405459925': Student(
    idCard: '3405459925',
    nis: 'S002',
    name: 'Maya Wijayanti',
    kelas: '10-B',
    photoAsset: 'assets/students/2.jpg',
  ),
  '3411097476': Student(
    idCard: '3411097476',
    nis: 'S003',
    name: 'Citra Dewi',
    kelas: '10-A',
    photoAsset: 'assets/students/3.jpg',
  ),
  '3392852549': Student(
    idCard: '3392852549',
    nis: 'S004',
    name: 'Andika Pramana',
    kelas: '11-C',
    photoAsset: 'assets/students/4.jpg',
  ),
  '3402934069': Student(
    idCard: '3402934069',
    nis: 'S005',
    name: 'Dewi Sartika',
    kelas: '11-A',
    photoAsset: 'assets/students/5.jpg',
  ),
  '3400725557': Student(
    idCard: '3400725557',
    nis: 'S006',
    name: 'Alya Listya W',
    kelas: '12-B',
    photoAsset: 'assets/students/6.jpg',
  ),
  '3393855557': Student(
    idCard: '3393855557',
    nis: 'S007',
    name: 'Gita Ramadhani',
    kelas: '12-A',
    photoAsset: 'assets/students/7.jpg',
  ),
  '3086150907': Student(
    idCard: '3086150907',
    nis: 'S008',
    name: 'Yuli Amanda',
    kelas: '10-C',
    photoAsset: 'assets/students/8.jpg',
  ),
  '3413951972': Student(
    idCard: '3413951972',
    nis: 'S009',
    name: 'Prasetyo Wibowo',
    kelas: '11-B',
    photoAsset: 'assets/students/9.jpg',
  ),
  '3401286485': Student(
    idCard: '3401286485',
    nis: 'S010',
    name: 'Amelia Oktaviani',
    kelas: '12-C',
    photoAsset: 'assets/students/10.jpg',
  ),
};
