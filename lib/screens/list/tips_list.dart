import 'package:flutter_trabalho3_opta1/commons.dart';


class TipsList extends StatefulWidget {
  const TipsList({super.key});

  @override
  State<TipsList> createState() => _TipsListState();
}

class _TipsListState extends State<TipsList> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TipsDao>(context, listen: false).loadTipss(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLabels.appBarList),
        automaticallyImplyLeading: false,
        actions: [IconButton(
          icon: const Icon(Icons.logout),
          onPressed: (){
            Navigator.pop(context);
          },
        )],
      ),

//SCREEN STYLE
      body: Consumer<TipsDao>(
        builder: (context, controller, child) {
          return Container(
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.containerBG,
              borderRadius: BorderRadius.circular(16),
            ),

//LIST BUILDER INDEX
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.tipsList.length,
                    itemBuilder: (context, index) {
                      final tipsList = controller.tipsList[index];
            
            //LIST                
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(tipsList.toTitle()),
                            subtitle: Text(tipsList.toSubtitle(),),
            //LIST ICONS                          
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
            //EDIT FROM LIST          
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute( 
                                        builder: (context) =>
                                        TipsForm(existingTips: tipsList)
                                      ),
                                    );
                                  },
                                ),
            //DELETE FROM LIST
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    controller.deleteTips(context, tipsList.id);
                                  },
                                ),
                              ],
                            ),
                          ),
            // DESCRIPTION             
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                tipsList.toDescription(),
                                textAlign: TextAlign.justify,
                                style:const TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ),
            
                          const Divider(color: AppColors.text),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          );
        }
      ),

//ADD BUTTON
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TipsForm()
            ),
          );
        },
      ),
    );
  }
}
