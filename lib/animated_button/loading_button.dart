import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingOutlinedButton(),
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Button Animation'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 24.0),
            minimumSize: const Size.fromHeight(72.0),
            shape: const StadiumBorder()
          ),
          child: isLoading
          ? const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white,),
              SizedBox(width: 24.0),
              Text('Please Wait...')
            ],
          )
          : const Text('Login'),
          onPressed: () async {
            if(isLoading) return;

            setState(() => isLoading = true);
            // After Loading go to Server.
            await Future.delayed(const Duration(seconds: 5));
            setState(() => false); 
          }
        ),
      ),
    );
  }
}



enum ButtonState { init, loading, done }
class LoadingOutlinedButton extends StatefulWidget {
  const LoadingOutlinedButton({Key? key}) : super(key: key);

  @override
  State<LoadingOutlinedButton> createState() => _LoadingOutlinedButtonState();
}

class _LoadingOutlinedButtonState extends State<LoadingOutlinedButton> {
  ButtonState state = ButtonState.init;
  bool isAniamting = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isStretched = isAniamting || state == ButtonState.init;
    final isDone = state == ButtonState.done;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Button Animation'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeIn,
          width: state == ButtonState.init ? width : 70,
          onEnd: () => setState(() => isAniamting = !isAniamting),
          height: 70,
        child: isStretched ? buildButton() : buildSmallButton(isDone),
        ),
      ),
    );
  }

  Widget buildButton() => OutlinedButton(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      side: const BorderSide(width: 2, color: Colors.indigo)
    ),
    child: const FittedBox(
      child: Text(
        'SUBMIT',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.indigo,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600
        ),
      ),
    ),
    onPressed: () async {
      setState(() => state = ButtonState.loading);
      await Future.delayed(const Duration(seconds: 3));
      setState(() => state = ButtonState.done);
      await Future.delayed(const Duration(seconds: 3));
      setState(() => state = ButtonState.init);
    }
  );

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.green : Colors.indigo;

    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isDone
        ? const Icon(Icons.done, size: 52, color: Colors.white)
        : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}