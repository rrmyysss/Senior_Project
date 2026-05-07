import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/auth_widgets.dart';
import '../../../application/auth/bloc/auth_bloc.dart';
import '../../../application/auth/bloc/auth_event.dart';
import '../../../application/auth/bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
            AuthEvent.signedIn(
              email: _emailController.text.trim(),
              password: _passwordController.text,
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
                authenticated: (_) => context.go('/home'),
                failure: (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Giriş başarısız oldu. Lütfen bilgilerinizi kontrol edin.'),
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
                        'Yeniden Merhaba',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1A2A3A),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Müziğin seni bekliyor, sadece bir bakış yeter.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6A8AAA),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 30),

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
                        controller: _passwordController,
                        hint: 'Şifre',
                        obscureText: _obscurePassword,
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() => _obscurePassword = !_obscurePassword),
                          child: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF9AB4CC),
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.length < 8) return 'Şifre en az 8 karakter olmalı.';
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                activeColor: const Color(0xFFA78BFA),
                                onChanged: (v) => setState(() => _rememberMe = v ?? false),
                                visualDensity: VisualDensity.compact,
                              ),
                              const Text(
                                'Beni Hatırla',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF6A8AAA),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Şifremi Unuttum?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A2A3A),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      AuthGradientButton(
                        label: isLoading ? 'Giriş yapılıyor...' : 'Giriş Yap',
                        isLoading: isLoading,
                        onTap: isLoading ? null : _onLoginPressed,
                      ),
                      const SizedBox(height: 32),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Hesabın yok mu?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6A8AAA),
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => context.pushReplacement('/register'),
                            child: const Text(
                              'Kayıt Ol',
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
