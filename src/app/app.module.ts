import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HelloWord } from './primer-componente/primer.componet';
import { FirstComponent } from './first/first.component'
@NgModule({
  declarations: [
    AppComponent, 
    HelloWord, FirstComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
