import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scan_barcode_absen/data_student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Student? _found;
  String _status = 'Menunggu data...';
  final MobileScannerController _controller = MobileScannerController();

  void _processId(String uid) {
    final student = students[uid];
    setState(() {
      if (student != null) {
        _found = student;
        _status = 'Data ditemukan!';
      } else {
        _found = null;
        _status = 'Tidak ada data siswa untuk UID ini.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absensi Scan Barcode'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => _controller.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch),
            onPressed: () => _controller.switchCamera(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // --- Kamera scanner kecil ---
            Container(
              width: double.infinity,
              height: 400, // ubah tinggi kamera di sini (200px)
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              clipBehavior: Clip.antiAlias,
              child: MobileScanner(
                controller: _controller,
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  if (barcodes.isNotEmpty) {
                    final String? uid = barcodes.first.rawValue;
                    if (uid != null) {
                      _processId(uid);
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 20),

            // --- Status atau data siswa ---
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: _found == null
                  ? _buildWaiting()
                  : _buildStudentCard(_found!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWaiting() {
    return Column(
      key: const ValueKey('waiting'),
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.qr_code_scanner, size: 64, color: Colors.grey),
        const SizedBox(height: 12),
        Text(
          _status,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStudentCard(Student s) {
    return Card(
      key: const ValueKey('studentCard'),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    s.photoAsset,
                    width: 90,
                    height: 130,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.person, size: 80),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'NIS: ${s.nis}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Kelas: ${s.kelas}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'UID: ${s.idCard}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _found = null;
                  _status = 'Menunggu data...';
                });
              },
              icon: const Icon(Icons.close),
              label: const Text('Selesai / Hapus'),
            ),
          ],
        ),
      ),
    );
  }
}
