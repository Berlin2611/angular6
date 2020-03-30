warning: LF will be replaced by CRLF in package-lock.json.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in package.json.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in src/app/app.component.html.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in src/app/app.component.ts.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in src/app/app.module.ts.
The file will have its original line endings in your working directory
[1mdiff --git a/package-lock.json b/package-lock.json[m
[1mindex 2989ee5..f6939aa 100644[m
[1m--- a/package-lock.json[m
[1m+++ b/package-lock.json[m
[36m@@ -2250,6 +2250,11 @@[m
       "integrity": "sha1-aN/1++YMUes3cl6p4+0xDcwed24=",[m
       "dev": true[m
     },[m
[32m+[m[32m    "bootstrap": {[m
[32m+[m[32m      "version": "4.4.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/bootstrap/-/bootstrap-4.4.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-tbx5cHubwE6e2ZG7nqM3g/FZ5PQEDMWmMGNrCUBVRPHXTJaH7CBDdsLeu3eCh3B1tzAxTnAbtmrzvWEvT2NNEA=="[m
[32m+[m[32m    },[m
     "brace-expansion": {[m
       "version": "1.1.11",[m
       "resolved": "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz",[m
[1mdiff --git a/package.json b/package.json[m
[1mindex f0307e2..2473291 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -19,6 +19,7 @@[m
     "@angular/platform-browser": "~9.0.6",[m
     "@angular/platform-browser-dynamic": "~9.0.6",[m
     "@angular/router": "~9.0.6",[m
[32m+[m[32m    "bootstrap": "^4.4.1",[m
     "rxjs": "~6.5.4",[m
     "tslib": "^1.10.0",[m
     "zone.js": "~0.10.2"[m
[1mdiff --git a/src/app/app.component.html b/src/app/app.component.html[m
[1mindex 0ccb7ee..e536ca9 100644[m
[1m--- a/src/app/app.component.html[m
[1m+++ b/src/app/app.component.html[m
[36m@@ -1,3 +1,9 @@[m
[32m+[m[32m<ul>[m
[32m+[m[32m  <li><a routerLink="/">Home</a></li>[m
[32m+[m[32m  <li><a routerLink="/about">About</a></li>[m
[32m+[m[32m</ul>[m
[32m+[m[32m<router-outlet></router-outlet>[m
[32m+[m
 [m
   <img[m
     width="40"[m
[36m@@ -9,5 +15,37 @@[m
   <hello-word></hello-word>[m
   <hr>[m
 <ul >[m
[31m-  <li *ngFor="let user of users"> {{ user }} </li>[m
[31m-</ul>[m
\ No newline at end of file[m
[32m+[m[32m     <app-user *ngFor="let user of users" [nameUser]="user"></app-user>[m
[32m+[m[32m</ul>[m
[32m+[m[32m<div>[m
[32m+[m[32m  <p>name: {{ name }} </p>[m
[32m+[m[32m  <p>street: {{ address.street }}</p>[m
[32m+[m[32m  <p>city: {{ address.city }}</p>[m
[32m+[m[32m        <form (submit)="agregarUsuario(newUser)" >[m
[32m+[m[32m          <input type="text" name="" id="" #newUser>[m
[32m+[m[32m          <button>[m
[32m+[m[32m            Add hobby[m
[32m+[m[32m          </button>[m
[32m+[m[32m        </form>[m
[32m+[m[32m  <ul>[m
[32m+[m[32m    <li *ngFor="let hobby of hobbies">[m
[32m+[m[32m      {{ hobby }}[m
[32m+[m[32m      <button (click)="delete(hobby)" >[m
[32m+[m[32m        x[m
[32m+[m[32m      </button>[m
[32m+[m[32m    </li>[m
[32m+[m[32m  </ul>[m
[32m+[m[32m</div>[m
[32m+[m[32m<div>[m
[32m+[m[32m  <form>[m
[32m+[m[32m    <input type="text " name="name" [(ngModel)]="name">[m
[32m+[m[32m    <input type="text " name="age" [(ngModel)] ="age" >[m
[32m+[m[32m  </form>[m
[32m+[m[32m  name: {{ name }} <br>[m
[32m+[m[32m  age: {{ age }}[m
[32m+[m[32m</div>[m
[32m+[m[32m<hr>[m
[32m+[m[32m<div *ngFor="let post of posts">[m
[32m+[m[32m  <h2> {{ post.title }} </h2>[m
[32m+[m[32m  <p> {{ post.body }} </p>[m
[32m+[m[32m</div>[m[41m [m
[1mdiff --git a/src/app/app.component.ts b/src/app/app.component.ts[m
[1mindex 34a9a29..f373006 100644[m
[1m--- a/src/app/app.component.ts[m
[1m+++ b/src/app/app.component.ts[m
[36m@@ -1,11 +1,44 @@[m
 import { Component } from '@angular/core';[m
[31m-[m
[32m+[m[32mimport { DataService } from './data.service';[m
 @Component({[m
   selector: 'app-root',[m
   templateUrl: './app.component.html',[m
   styleUrls: ['./app.component.css'][m
 })[m
 export class AppComponent {[m
[31m-  title = 'angular';[m
[31m-  users = ['ryan', 'joe', 'dani', 'jhon', 'bruce'];[m
[32m+[m
[32m+[m[32m  users: string [];[m[41m [m
[32m+[m[32m  age: number;[m
[32m+[m[32m  address:{[m
[32m+[m[32m    street: string;[m
[32m+[m[32m    city: string;[m
[32m+[m[32m  }[m
[32m+[m[32m  hobbies: string[];[m
[32m+[m[32m  name: string;[m
[32m+[m[32m  posts: any[];[m
[32m+[m[32m  constructor(private dataService: DataService){[m
[32m+[m[32m    this.dataService.getData().subscribe(data =>{[m
[32m+[m[32m      this.posts = data;[m
[32m+[m[32m    });[m
[32m+[m[32m    this.users = ['ryan', 'joe', 'dani', 'jhon', 'bruce'];[m
[32m+[m[32m    this.name = this.users[0];[m
[32m+[m[32m    this.age = 12;[m
[32m+[m[32m    this.address = {[m
[32m+[m[32m      street: 'Calle 78 b sur',[m
[32m+[m[32m      city: 'London'[m
[32m+[m[32m    }[m
[32m+[m[32m    this.hobbies = ['swimming', 'read', 'write'];[m
[32m+[m[32m  }[m
[32m+[m[32m  delete(hobby){[m
[32m+[m[32m   for(let i = 0; i< this.hobbies.length; i++){[m
[32m+[m[32m    if(hobby == this.hobbies[i]){[m
[32m+[m[32m      this.hobbies.splice(i, 1);[m
[32m+[m[32m    }[m
[32m+[m[32m   }[m
[32m+[m[32m  }[m
[32m+[m[32m  agregarUsuario(newUser){[m
[32m+[m[32m    this.hobbies.push(newUser.value);[m
[32m+[m[32m    newUser.value = '';[m
[32m+[m[32m    return false;[m
[32m+[m[32m  }[m
 }[m
[1mdiff --git a/src/app/app.module.ts b/src/app/app.module.ts[m
[1mindex 23214a5..cb7cfa8 100644[m
[1m--- a/src/app/app.module.ts[m
[1m+++ b/src/app/app.module.ts[m
[36m@@ -1,20 +1,34 @@[m
 import { BrowserModule } from '@angular/platform-browser';[m
 import { NgModule } from '@angular/core';[m
[31m-[m
[32m+[m[32mimport { FormsModule} from '@angular/forms';[m
 import { AppRoutingModule } from './app-routing.module';[m
 import { AppComponent } from './app.component';[m
 import { HelloWord } from './primer-componente/primer.componet';[m
[31m-import { FirstComponent } from './first/first.component'[m
[32m+[m[32mimport { FirstComponent } from './first/first.component';[m
[32m+[m[32mimport { UserComponent } from './user/user.component'[m
[32m+[m[32mimport { DataService } from './data.service';[m
[32m+[m[32mimport { HttpClientModule } from '@angular/common/http';[m
[32m+[m[32mimport { RouterModule, Route, RouteConfigLoadEnd, Routes} from '@angular/router';[m
[32m+[m[32mimport { AboutComponent } from './about/about.component';[m
[32m+[m
[32m+[m[32mconst routes: Route[] = [[m
[32m+[m[32m  {path: '', component: HelloWord},[m
[32m+[m[32m  {path: 'about', component: AboutComponent}[m
[32m+[m[32m][m
[32m+[m
 @NgModule({[m
   declarations: [[m
     AppComponent, [m
[31m-    HelloWord, FirstComponent[m
[32m+[m[32m    HelloWord, FirstComponent, UserComponent, AboutComponent[m
   ],[m
   imports: [[m
     BrowserModule,[m
[31m-    AppRoutingModule[m
[32m+[m[32m    AppRoutingModule,[m
[32m+[m[32m    FormsModule,[m
[32m+[m[32m    HttpClientModule,[m
[32m+[m[32m    RouterModule.forRoot(routes)[m
   ],[m
[31m-  providers: [],[m
[32m+[m[32m  providers: [DataService],[m
   bootstrap: [AppComponent][m
 })[m
 export class AppModule { }[m
