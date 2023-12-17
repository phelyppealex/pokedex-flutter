import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> abrirUrl (String link) async {
  String url = link;
  if(!await canLaunchUrl(Uri.parse(url))){
    await launchUrl(Uri.parse(url));
  } else {
    throw 'not found';
  }
}

class CardDev extends StatelessWidget {
  final nome;
  final email;
  final github;

  const CardDev({
    super.key,
    required this.nome,
    required this.email,
    required this.github
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(nome),
        const SizedBox(height: 10.5),
        TextButton(
          child: const Text('Enviar email'),
          onPressed: () async {
            String linkEmail = 'mailto:${email}?Subject=Título%20da%20mensagem';
            abrirUrl(linkEmail);
          },
        ),
        TextButton(
          child: const Text('Github'), 
          onPressed: () async {
            abrirUrl(github);
          },
        ),
      ],
    );
  }
}