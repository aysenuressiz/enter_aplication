import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Login Ekranı',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'images/flutter.png',
                  width: 200.0,
                  height: 150.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      // Validation successful
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(
                            username: _usernameController.text,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('LOG IN',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 0.01),
                child: Text(
                  'New User? Create Account',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String username;

  const SecondPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username',
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: const ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(product: products[index]);
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(product.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.name),
          ),
          ElevatedButton(
            onPressed: () {
              // Sepete ekle butonu tıklanınca burada işlemler yapılabilir.
              // Örneğin: Sepete eklenen ürünü bir liste üzerinde tutabilirsiniz.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ürün sepete eklendi: ${product.name}'),
                ),
              );
            },
            child: const Text('Sepete Ekle'),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String image;

  Product({required this.name, required this.image});
}

List<Product> products = [
  Product(
      name: 'Huawei Matepad SE 10.4 inch Wifi Tablet',
      image: 'images/tablet.jpg'),
  Product(
      name: 'Samsung S23 Ultra 512 GB Cep Telefonu',
      image: 'images/telefon.jpg'),
  Product(name: 'Lenovo Ideapad Gaming 3 Laptop', image: 'images/lenovo.jpg'),
  Product(name: 'Monster Huma H4 V5 Laptop', image: 'images/huma.jpg'),
];
