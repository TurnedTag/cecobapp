import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teste/atividade.dart';
import 'package:teste/destaque.dart';
import 'package:teste/eventos.dart';
import 'package:teste/melhoria.dart';
import 'package:teste/paginaInicial.dart';

class Inicio2 extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9FDFF),
      body: Center(
        child: 
        Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                        SizedBox(height: 60),

                Text(
                  'CECOB Bairro', 
                  style: TextStyle(
                    color: Color(0xff9CD5FF),
                    fontSize: 24,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
                 SizedBox(height: 20), 
          Container(
          width: 400, 
          height: 300, 
          color: Colors.blue.shade200, 
          child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(-22.955779274882516, -43.18715381860818), zoom: 16)),
        ),
         SizedBox(height: 60), 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
          ElevatedButton(
                onPressed: () {
                  Navigator.push(
          context, MaterialPageRoute(builder: (context) => Inicio()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, 
                  fixedSize: Size(180, 60),
                ),
                child: Text(
                  'Recomendações',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold, 

                  ),
                ),
              ),
                       SizedBox(width: 20), 

              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, 
                  fixedSize: Size(180, 60),
                ),
                child: Text(
                  'Vamos melhorar',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold, 

                  ),
                ),
              ),
              
        ],),
        SizedBox(height: 30), 
          Container(
          width: 1100, 
          height: 290, 
          color: Colors.blue.shade200, 
          
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Vamos Melhorar",
          style: TextStyle(
          color: Colors.black,
         fontWeight: FontWeight.bold,
           fontSize: 30,)
              ),
               SizedBox(height: 30), 
            Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Icons.person, 
        color: Colors.black,
      ),
      SizedBox(width: 8.0), 
      Container(
        width: 350,
        height: 30,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(8.0), 
          child: Text(
            "Buracos na Rua Paulo Barreto",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
    
  ),
),

SizedBox(height: 30), 

Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Icons.person, 
        color: Colors.black,
      ),
      SizedBox(width: 8.0), 
      Container(
        width: 350,
        height: 30,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(8.0), 
          child: Text(
            "Buracos na Rua Paulo Barreto",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
    
  ),
),

SizedBox(height: 30), 

Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Icons.person, 
        color: Colors.black,
      ),
      SizedBox(width: 8.0), 
      Container(
        width: 350,
        height: 30,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(8.0), 
          child: Text(
            "Buracos na Rua Paulo Barreto",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
    
  ),
),


            ],
            
          ),
          ),
      Column(
  children: [
    Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
        color: Colors.white,
        height: 80, 
        width: 450, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Destaque()));
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.local_activity, color: Colors.black, size: 20),
                      SizedBox(height: 3), 
                      Text(
                        "Destaques",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 5,
                        ),
                      ),
                    ],
                  ),
                  label: SizedBox.shrink(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), 
                    ),
                    elevation: 2,
                    fixedSize: Size(60, 35), 
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => melhoria()));
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.trending_up, color: Colors.black, size: 20),
                      SizedBox(height: 3),
                      Text(
                        "Melhoria",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 5,
                        ),
                      ),
                    ],
                  ),
                  label: SizedBox.shrink(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 2,
                    fixedSize: Size(60, 35),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.location_city, color: Colors.black, size: 20),
                      SizedBox(height: 3),
                      Text(
                        "Bairro",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 5,
                        ),
                      ),
                    ],
                  ),
                  label: SizedBox.shrink(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 2,
                    fixedSize: Size(60, 35),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => atividade()));
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.cleaning_services, color: Colors.black, size: 20),
                      SizedBox(height: 3),
                      Text(
                        "Atividade",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 5,
                        ),
                      ),
                    ],
                  ),
                  label: SizedBox.shrink(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 2,
                    fixedSize: Size(60, 35),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Eventos()));
                  },
                  icon: Column(
                    children: [
                      Icon(Icons.event, color: Colors.black, size: 20),
                      SizedBox(height: 3),
                      Text(
                        "Eventos",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 5,
                        ),
                      ),
                    ],
                  ),
                  label: SizedBox.shrink(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 2,
                    fixedSize: Size(60, 35),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ],
),






          ],
        ),
      
        
      
          
          ),
          
              
              
            );
            


   
  }
}

        

  
  