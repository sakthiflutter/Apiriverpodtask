

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thiranapisakthi/utils/app_colors.dart';
import '../provider/repomodelservice.dart';
class Repoviewpage extends ConsumerWidget {
  const Repoviewpage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    var  mheight=MediaQuery.of(context).size.height;
    final repodata=ref.watch(repoDataProvider);
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.menu,),
                  Icon(Icons.more_vert)
                ],
              ),
            ),

            repodata.when(data: (data){
              return  SizedBox(

                height: mheight*0.9,
                child: ListView.builder(
                  itemCount: data.items.length,

                    itemBuilder: (
                    context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.shadeColor1,
                        borderRadius: BorderRadius.circular(19)
                      ),
                      height: 200,

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipOval(child: Image.network(data.items[index].owner.avatarUrl)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text("Repo name : ",style: TextStyle(fontWeight: FontWeight.w600),),
                                Text(data.items[index].name),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text("Repo description : ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),

                                SizedBox(
                                  width: 200,
                                    child: Text(data.items[index].description??'',overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text("Repo stars : ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),

                                SizedBox(
                                    width: 200,
                                    child: Text(data.items[index].stargazersCount.toString(),overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Repo Username : ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),

                                SizedBox(
                                    width: 200,
                                    child: Text(data.items[index].name,overflow: TextOverflow.ellipsis,)),
                              ],
                            ),

                          ],
                        ),
                      ),


                    ),
                  );
                }),

              );
            }, error: (err, s) => Text(err.toString()),
                loading: ()=>const Center(child: CircularProgressIndicator()))
            
          ],
        ),
      ),

    );
  }
}

