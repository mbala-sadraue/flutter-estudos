import 'bloc/contact_bloc.dart';
import 'bloc/contact_event.dart';
import 'bloc/contact_state.dart';
import 'models/contact.dart';

void main(){

  final contactBloc = ContactBloc();
  contactBloc.inputContact.add(GetContact());
  contactBloc.inputContact.add(PostContact(contact: Contact(name: 'nome',number: "935378674")));

  print("ola");
}