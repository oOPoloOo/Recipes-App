import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
import 'package:recipes_app/router/route.names.dart';


class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(       
        body: Container(
          width: media.width,
          height: media.height,
          child: Center(
              child:                 
                Column(
                  children: [
                    _UserImage(),
                    _FullNameText(),
                    _EmailText(),
                    _LogOutButton()
                  ],
               )
            ),
        )
      );
  }
}

class _UserImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocBuilder<AuthStatusBloc, AuthStatusState>(
      builder: (context, state) {
       if(state.user.photoUrl == '' || state.user.photoUrl == null)
       {
          return Padding(
          padding: EdgeInsets.all(15),
          child: GestureDetector(
            onTap: (){},
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: media.width * 0.2,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: media.width * 0.2,
              ),
            ),
          ),
        );
       } 
        else
       {
         return Padding(
          padding: EdgeInsets.all(15),
          child: CircleAvatar(
            backgroundImage: NetworkImage(state.user.photoUrl!),
            radius: media.width * 0.2,
            
          ),
        );
       }
        
      },
    );
  }
}

class _FullNameText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStatusBloc, AuthStatusState>(
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              '${state.user.name}',
              style: TextStyle(fontSize: 24),
            ));
      },
    );
  }
}

class _EmailText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStatusBloc, AuthStatusState>(
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.all(15),
            child: Text(
             '${state.user.email}',
              style: TextStyle(fontSize: 24),
            ));
      },
    );
  }
}

class _LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * 0.45,
      alignment: Alignment.bottomCenter,
      child: Container(
        height: media.height * 0.06,
        width: media.width * 0.4,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            primary: const Color(0xFFFFD600),
          ),
          onPressed: () {
            BlocProvider.of<AuthStatusBloc>(context).add(AuthLogoutRequest());
            Get.offAllNamed(loginRouteName);
          },
          child: const Text('Log Out', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
