import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bandnames/services/socket_services.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Server Status: ${socketService.serverStatus}',
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {
            socketService.socket.emit('emitir-mensaje',
                {"nombre": "flutter", "mensaje": "mensaje desde flutter"});
          }),
    );
  }
}
