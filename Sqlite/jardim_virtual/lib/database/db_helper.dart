class JardimVirtualDB {
  static Database? _database;

  static final JardimVirtualDB _instance = JardimVirtualDB._internal();

  JardimVirtualDB._internal();
  factory JardimVirtualDB() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final _dbPath = await getDatabasesPath();
    final path = join(_dbPath, 'jardim_virtual.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS plantas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        especie TEXT NOT NULL,
        data_aquisicao TEXT NOT NULL,
        local TEXT NOT NULL,
      )
    ''');
    print("banco plata criado");

    await db.execute('''
      CREATE TABLE IF NOT EXISTS cuidados (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        planta_id INTEGER NOT NULL,
        rega INTEGER NOT NULL,
        adubacao TEXT NOT NULL,
        data_cuidado TEXT NOT NULL,
        observacoes TEXT NOT NULL
        FOREIGN KEY (planta_id) REFERENCES plantas (id) ON DELETE CASCADE
      )
    ''');
    print("banco cuidados criado");
  }

  Future<int> insertPlanta(Planta planta) async {
    final db = await database;
    return await db.insert('plantas', planta.toMap());
  }

  Future<List<Planta>> getPlantas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('plantas');
    
    return maps.map((map) => Planta.fromMap(map)).toList();
  }

  Future<Planta?> getPlantaById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'plantas',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Planta.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deletePlanta(int id) async {
    final db = await database;
    return await db.delete("plantas", where: "id=?", whereArgs: [id]);
  }

  Future<int> insertCuidado(Cuidado cuidados) async {
    final db = await database;
    return await db.insert("cuidados", cuidados.toMap());
  }

  Future<List<Cuidado>> getCuidadoPlantas(int plantaId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "cuidados",
      where: "planta_id = ?",
      whereArgs: [plantaId],
    );
    return maps.map((e) => Cuidado.fromMap(e)).toList();
  }

  Future<int> deleteCuidado(int id) async {
    final db = await database;
    return await db.delete("cuidados", where: "id = ?", whereArgs: [id]);
  }
}