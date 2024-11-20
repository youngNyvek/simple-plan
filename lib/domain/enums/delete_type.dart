class DeleteType {
  final String description;
  final int id;

  const DeleteType(this.description, this.id);

  static const ocurrence = DeleteType("delete_ocurrence", 1);
  static const serie = DeleteType("delete_serie", 2);

  static const deleteTypesList = [ocurrence, serie];
}
