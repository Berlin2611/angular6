import { Component } from '@angular/core';
import { DataService } from './data.service';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  users: string []; 
  age: number;
  address:{
    street: string;
    city: string;
  }
  hobbies: string[];
  name: string;
  posts: any[];
  constructor(private dataService: DataService){
    this.dataService.getData().subscribe(data =>{
      this.posts = data;
    });
    this.users = ['ryan', 'joe', 'dani', 'jhon', 'bruce'];
    this.name = this.users[0];
    this.age = 12;
    this.address = {
      street: 'Calle 78 b sur',
      city: 'London'
    }
    this.hobbies = ['swimming', 'read', 'write'];
  }
  delete(hobby){
   for(let i = 0; i< this.hobbies.length; i++){
    if(hobby == this.hobbies[i]){
      this.hobbies.splice(i, 1);
    }
   }
  }
  agregarUsuario(newUser){
    this.hobbies.push(newUser.value);
    newUser.value = '';
    return false;
  }
}
