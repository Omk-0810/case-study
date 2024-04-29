import 'package:case_study/chatBot/Messages.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller=TextEditingController();

  List <Map<String,dynamic>>messages=[];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter=instance);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        title: Text('Chat Bot',style: TextStyle(color: Colors.white),),
      ),
      body:Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages:messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 8),
              color: Colors.deepPurple[600],
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Ask questions and tips',
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5) )
                        ),
                      )),
                  IconButton(onPressed: (){
                    sendMessage(_controller.text);
                    _controller.clear();
                  }, icon: Icon(Icons.send,color: Colors.white,)),
                ],
              ),
            )
          ],
        ),
      ) ,
    );
  }

  sendMessage(String text)async{
    if(text.isEmpty){
      return;
    }
    else{
      setState(() {
        addMessage(Message (text: DialogText(text: [text])),true);

      });
      DetectIntentResponse response=await dialogFlowtter.detectIntent(queryInput: QueryInput(text:TextInput(text: text)));
      if(response.message==null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }
  addMessage(Message message,[bool isUserMessage=false]){
    messages.add({
      'message':message,
      'isUserMessage':isUserMessage
    });
  }

}
