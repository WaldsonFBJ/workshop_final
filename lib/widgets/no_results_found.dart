import 'package:flutter/material.dart';

import '../constants.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error,
                size: 45,
                color: Colors.white.withOpacity(.6),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Algo deu errado!",
                style: heading.copyWith(color: Colors.white.withOpacity(.9)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nos desculpe pelos erros, tente novamente mais tarde.",
                textAlign: TextAlign.center,
                style: normalText.copyWith(color: Colors.white.withOpacity(.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite,
              size: 45,
              color: Colors.white.withOpacity(.6),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Você ainda não tem favoritos',
              style: heading.copyWith(color: Colors.white.withOpacity(.9)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Adicione seus filmes e shows favoritos para ficar por dentro sobre eles.',
              textAlign: TextAlign.center,
              style: normalText.copyWith(color: Colors.white.withOpacity(.9)),
            ),
          ],
        ),
      ),
    );
  }
}

class WatchListFavorites extends StatelessWidget {
  const WatchListFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.bookmark_add,
              size: 45,
              color: Colors.white.withOpacity(.6),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sua lista de assistir esta vazia',
              style: heading.copyWith(color: Colors.white.withOpacity(.9)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Adicione shows e filmes a lista para lembrar do que gostaria de assistir..",
              textAlign: TextAlign.center,
              style: normalText.copyWith(color: Colors.white.withOpacity(.9)),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyCollections extends StatelessWidget {
  const EmptyCollections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.list,
              size: 45,
              color: Colors.white.withOpacity(.6),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Você ainda não tem nenhuma coleção",
              style: heading.copyWith(color: Colors.white.withOpacity(.9)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Crie sua propia coleção de filmes e shows.",
              textAlign: TextAlign.center,
              style: normalText.copyWith(color: Colors.white.withOpacity(.9)),
            ),
          ],
        ),
      ),
    );
  }
}

class NoResultsFound extends StatelessWidget {
  const NoResultsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      padding: const EdgeInsets.all(26),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search,
                size: 45,
                color: Colors.white.withOpacity(.6),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "404 não encontrado",
                style: heading.copyWith(color: Colors.white.withOpacity(.9)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nos não achamos nada relacionado a sua busca, por favor tente ser mais especifico.",
                textAlign: TextAlign.center,
                style: normalText.copyWith(color: Colors.white.withOpacity(.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
