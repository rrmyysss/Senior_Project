import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/atoms/app_text_field.dart';
import '../../core/atoms/gradient_scaffold.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isSaving = false;
  String? _errorMessage;

  bool get _canSave {
    return _oldPasswordController.text.isNotEmpty &&
        _newPasswordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        !_isSaving;
  }

  @override
  void initState() {
    super.initState();
    _oldPasswordController.addListener(_onChange);
    _newPasswordController.addListener(_onChange);
    _confirmPasswordController.addListener(_onChange);
  }

  void _onChange() => setState(() => _errorMessage = null);

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _savePassword() async {
    if (!_canSave) return;

    final oldPwd = _oldPasswordController.text;
    final newPwd = _newPasswordController.text;
    final confirmPwd = _confirmPasswordController.text;

    if (newPwd != confirmPwd) {
      setState(() => _errorMessage = 'Yeni şifreler eşleşmiyor.');
      return;
    }

    if (newPwd.length < 6) {
      setState(() => _errorMessage = 'Yeni şifreniz en az 6 karakter olmalıdır.');
      return;
    }

    setState(() => _isSaving = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && user.email != null) {
        // Re-authenticate
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPwd,
        );

        await user.reauthenticateWithCredential(credential);

        // Update password
        await user.updatePassword(newPwd);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Şifreniz başarıyla güncellendi.'),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
          Navigator.of(context).pop();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        setState(() {
          if (e.code == 'wrong-password') {
            _errorMessage = 'Eski şifre hatalı.';
          } else {
            _errorMessage = 'Bir hata oluştu: ${e.message}';
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Beklenmeyen bir hata oluştu.';
        });
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: Text('Şifremi Değiştir', style: AppTextStyles.titleL),
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
            const SizedBox(height: 24),
            _buildFieldGroup('Eski Şifre', _oldPasswordController, Icons.lock_outline),
            _buildFieldGroup('Yeni Şifre', _newPasswordController, Icons.lock_outline),
            _buildFieldGroup('Yeni Şifre Tekrar', _confirmPasswordController, Icons.lock_outline),

            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),

            const SizedBox(height: 32),

            // ── Kaydet Butonu ───────────────────────────────
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _canSave ? 1.0 : 0.45,
              child: GestureDetector(
                onTap: _canSave ? _savePassword : null,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _canSave ? AppColors.primary : null,
                    gradient: _canSave
                        ? null
                        : LinearGradient(
                            colors: [
                              Colors.grey.shade300,
                              Colors.grey.shade400,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                    boxShadow: _canSave
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
                            'Şifreyi Kaydet',
                            style: AppTextStyles.bodyL.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldGroup(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
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
            hintText: '•' * 8, // Placeholder password style
            controller: controller,
            obscureText: true,
            prefixIcon: Icon(icon, color: AppColors.textHint),
          ),
        ],
      ),
    );
  }
}
