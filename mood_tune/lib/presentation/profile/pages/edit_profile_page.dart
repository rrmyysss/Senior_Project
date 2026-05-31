import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/atoms/app_text_field.dart';
import '../../core/atoms/gradient_scaffold.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  // Başlangıç değerleri — değişiklik tespiti için
  late String _initialName;
  late String _initialEmail;
  late String _initialPhone;

  File? _newPhoto;
  bool _isPicking = false;
  bool _isSaving = false;

  bool get _hasChanges {
    return _nameController.text.trim() != _initialName ||
        _emailController.text.trim() != _initialEmail ||
        _phoneController.text.trim() != _initialPhone ||
        _newPhoto != null;
  }

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    _initialName = user?.displayName ?? '';
    _initialEmail = user?.email ?? '';
    _initialPhone = user?.phoneNumber ?? '';

    _nameController = TextEditingController(text: _initialName)
      ..addListener(() => setState(() {}));
    _emailController = TextEditingController(text: _initialEmail)
      ..addListener(() => setState(() {}));
    _phoneController = TextEditingController(text: _initialPhone)
      ..addListener(() => setState(() {}));

    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          final firestoreName = data['displayName'] as String?;
          final firestorePhone = data['phone'] as String?;
          
          if (mounted) {
            setState(() {
              if (firestoreName != null && firestoreName.isNotEmpty && _initialName.isEmpty) {
                _initialName = firestoreName;
                _nameController.text = firestoreName;
              }
              if (firestorePhone != null && firestorePhone.isNotEmpty && _initialPhone.isEmpty) {
                _initialPhone = firestorePhone;
                _phoneController.text = firestorePhone;
              }
            });
          }
        }
      } catch (e) {
        debugPrint('Error loading user data from Firestore: $e');
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    if (_isPicking) return;
    setState(() => _isPicking = true);
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (picked != null) {
        setState(() => _newPhoto = File(picked.path));
      }
    } finally {
      setState(() => _isPicking = false);
    }
  }

  Future<void> _saveChanges() async {
    if (!_hasChanges || _isSaving) return;
    setState(() => _isSaving = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // 1) Fotoğraf değiştiyse yerel dosya yolunu kullan (Firebase Storage kapalı olduğu için)
      String? newPhotoUrl;
      if (_newPhoto != null) {
        newPhotoUrl = _newPhoto!.path;
      }

      // 2) Display name değiştiyse güncelle
      final newName = _nameController.text.trim();
      final newPhone = _phoneController.text.trim();
      
      if (newName != _initialName || newPhotoUrl != null) {
        await user.updateProfile(
          displayName: newName.isNotEmpty ? newName : null,
          photoURL: newPhotoUrl,
        );
        await user.reload();
      }

      // 3) Firestore'u güncelle
      try {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          if (newName.isNotEmpty) 'displayName': newName,
          if (newPhone.isNotEmpty) 'phone': newPhone,
          if (newPhotoUrl != null) 'photoUrl': newPhotoUrl,
        }, SetOptions(merge: true));
      } catch (e) {
        debugPrint('Firestore update error: $e');
      }

      // 4) E-posta değiştiyse güncelle
      final newEmail = _emailController.text.trim();
      if (newEmail != _initialEmail && newEmail.isNotEmpty) {
        await user.verifyBeforeUpdateEmail(newEmail);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Yeni e-postanıza doğrulama bağlantısı gönderildi.'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }

      // Başlangıç değerlerini güncelle
      _initialName = newName.isNotEmpty ? newName : _initialName;
      _initialEmail = newEmail.isNotEmpty ? newEmail : _initialEmail;
      _initialPhone = newPhone.isNotEmpty ? newPhone : _initialPhone;
      setState(() => _newPhoto = null);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Profil güncellendi!'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Hata: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL;
    final canSave = _hasChanges && !_isSaving;

    return GradientScaffold(
      appBar: AppBar(
        title: Text('Profili Düzenle', style: AppTextStyles.titleL),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: AppColors.textPrimary, size: 20),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // ── Avatar ─────────────────────────────────────
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: _newPhoto != null
                              ? Image.file(_newPhoto!, fit: BoxFit.cover)
                              : photoUrl != null
                                  ? (photoUrl.startsWith('http')
                                      ? Image.network(photoUrl, fit: BoxFit.cover, errorBuilder: (ctx, e, s) => _defaultAvatar())
                                      : Image.file(File(photoUrl), fit: BoxFit.cover))
                                  : _defaultAvatar(),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: _pickPhoto,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadow.withValues(alpha: 0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.edit, color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: _pickPhoto,
                    child: Text(
                      'Fotoğrafı Değiştir',
                      style: AppTextStyles.label.copyWith(
                          color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // ── Form ────────────────────────────────────────
            _buildFieldGroup('Kullanıcı Adı', _nameController, Icons.person_outline),
            _buildFieldGroup('Eposta', _emailController, Icons.email_outlined, isEmail: true),
            _buildFieldGroup('Telefon', _phoneController, Icons.phone_outlined, isPhone: true),

            const SizedBox(height: 16),

            // Şifre Değiştir
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.divider),
              ),
              child: ListTile(
                leading: const Icon(Icons.lock_outline, color: AppColors.textPrimary),
                title: Text('Şifremi Değiştir',
                    style: AppTextStyles.bodyM.copyWith(fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                onTap: () {
                  context.push('/change-password');
                },
              ),
            ),

            const SizedBox(height: 48),

            // ── Kaydet Butonu ───────────────────────────────
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: canSave ? 1.0 : 0.45,
              child: GestureDetector(
                onTap: canSave ? _saveChanges : null,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: canSave
                        ? const LinearGradient(
                            colors: [AppColors.primary, AppColors.primaryDark],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                        : LinearGradient(
                            colors: [
                              Colors.grey.shade300,
                              Colors.grey.shade400,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                    boxShadow: canSave
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                  child: Center(
                    child: _isSaving
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(
                            'Değişiklikleri Kaydet',
                            style: AppTextStyles.bodyL.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _defaultAvatar() {
    return Container(
      color: AppColors.primaryLight,
      child: const Icon(Icons.person, color: AppColors.primary, size: 40),
    );
  }

  Widget _buildFieldGroup(
    String label,
    TextEditingController controller,
    IconData icon, {
    bool isEmail = false,
    bool isPhone = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              label,
              style: AppTextStyles.label.copyWith(
                  color: AppColors.textSecondary, fontWeight: FontWeight.bold),
            ),
          ),
          AppTextField(
            hintText: label,
            controller: controller,
            prefixIcon: Icon(icon, color: AppColors.textHint),
            keyboardType: isEmail
                ? TextInputType.emailAddress
                : (isPhone ? TextInputType.phone : TextInputType.text),
          ),
        ],
      ),
    );
  }
}
