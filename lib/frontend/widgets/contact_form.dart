import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContactFormulaire extends StatefulWidget {
  const ContactFormulaire({super.key});

  @override
  State<ContactFormulaire> createState() => _ContactFormulaireState();
}

class _ContactFormulaireState extends State<ContactFormulaire> {
  String email = "";
  String mdp = "";
  String objet = "";
  String text = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            decoration: InputDecoration(
                hintText: "votre adresse e-mail",
                labelText: "E-mail*",
                prefixIcon: Icon(MdiIcons.at),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(14.0)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              if (value!.replaceAll(" ", "").isEmpty) {
                return "Le champ est vide";
              } else {
                if (!value.replaceAll(" ", "").endsWith("@gmail.com")) {
                  return "Entrez une adresse gool valide";
                } else {
                  return null;
                }
              }
            },
            onChanged: (value) {
              mdp = value;
            },
            decoration: const InputDecoration(
                hintText: "votre mot de passe d'adresse e-mail",
                labelText: "Mdp*",
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(14.0)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              objet = value;
            },
            decoration: const InputDecoration(
                hintText: "L'objet de votre demande",
                labelText: "Objet*",
                prefix: Text("Obj: "),
                border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(14.0)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            // controller: _textEditingController,
            maxLines: 8, // Permet une saisie de texte multiligne
            onChanged: (value) {
              text = value;
            },
            decoration: const InputDecoration(
              hintText: 'Le corps de votre texte',
              helperText: "Entrez votre message",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            icon: Icon(MdiIcons.emailArrowRightOutline),
            label: const Text("Envoyer"),
          )
        ],
      ),
    );
  }
}
