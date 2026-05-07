import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import '../widgets/auth_widgets.dart';
import '../../../application/auth/bloc/auth_bloc.dart';
import '../../../application/auth/bloc/auth_event.dart';
import '../../../application/auth/bloc/auth_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _adController = TextEditingController();
  final _soyadController = TextEditingController();
  final _telController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _pass2Controller = TextEditingController();
  bool _obscurePass = true;
  bool _obscurePass2 = true;

  @override
  void dispose() {
    _adController.dispose();
    _soyadController.dispose();
    _telController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _pass2Controller.dispose();
    super.dispose();
  }

  void _onRegisterPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      final displayName = '${_adController.text.trim()} ${_soyadController.text.trim()}';
      context.read<AuthBloc>().add(
            AuthEvent.registered(
              email: _emailController.text.trim(),
              password: _passController.text,
              displayName: displayName,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: authBackgroundDecoration,
        child: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                authenticated: (_) async {
                  // Kayıt başarılı: çıkış yap ve giriş ekranına yönlendir
                  await fb_auth.FirebaseAuth.instance.signOut();
                  if (context.mounted) context.go('/login');
                },
                failure: (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Kayıt başarısız oldu. Lütfen tekrar deneyin.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              final isLoading = state.maybeMap(loading: (_) => true, orElse: () => false);
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(28, 50, 28, 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthBackButton(
                        onTap: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go('/welcome');
                          }
                        },
                      ),
                      const SizedBox(height: 28),

                      const Text(
                        'Müziğine Kavuş',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1A2A3A),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Bir hesap oluştur, duygularına özel playlist seni beklesin.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6A8AAA),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 30),

                      AuthGlassInputField(
                        controller: _adController,
                        hint: 'Ad',
                        validator: (v) =>
                            (v == null || v.trim().isEmpty) ? 'Ad zorunludur.' : null,
                      ),
                      const SizedBox(height: 14),
                      AuthGlassInputField(
                        controller: _soyadController,
                        hint: 'Soyad',
                        validator: (v) =>
                            (v == null || v.trim().isEmpty) ? 'Soyad zorunludur.' : null,
                      ),
                      const SizedBox(height: 14),
                      AuthGlassInputField(
                        controller: _telController,
                        hint: 'Telefon (opsiyonel)',
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 14),
                      AuthGlassInputField(
                        controller: _emailController,
                        hint: 'E-posta',
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: const Icon(Icons.email_outlined, color: Color(0xFF9AB4CC)),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) return 'Geçerli bir e-posta girin.';
                          if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v)) {
                            return 'Geçerli bir e-posta girin.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      AuthGlassInputField(
                        controller: _passController,
                        hint: 'Şifre',
                        obscureText: _obscurePass,
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() => _obscurePass = !_obscurePass),
                          child: Icon(
                            _obscurePass
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF9AB4CC),
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.length < 8) return 'En az 8 karakter olmalı.';
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      AuthGlassInputField(
                        controller: _pass2Controller,
                        hint: 'Şifre Tekrar',
                        obscureText: _obscurePass2,
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() => _obscurePass2 = !_obscurePass2),
                          child: Icon(
                            _obscurePass2
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF9AB4CC),
                          ),
                        ),
                        validator: (v) {
                          if (v != _passController.text) return 'Şifreler uyuşmuyor.';
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      AuthGradientButton(
                        label: isLoading ? 'Kayıt yapılıyor...' : 'Kayıt Ol',
                        isLoading: isLoading,
                        onTap: isLoading ? null : _onRegisterPressed,
                      ),
                      const SizedBox(height: 32),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Zaten hesabın var mı?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6A8AAA),
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => context.pushReplacement('/login'),
                            child: const Text(
                              'Giriş Yap',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1A2A3A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
