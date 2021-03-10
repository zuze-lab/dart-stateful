import 'package:stateful/stateful.dart';

void main() {
  var state = Stateful('joe');
}

// import { state } from '@zuze/stateful';

// const s = state({fetching:false,error:false});
// s.setState({fetching:true}); // { fetching: true, error: false }
// s.setState(state => ({ ...state, fetching: false, data:'some data' }))
