import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule} from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HelloWord } from './primer-componente/primer.componet';
import { FirstComponent } from './first/first.component';
import { UserComponent } from './user/user.component'
import { DataService } from './data.service';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule, Route, RouteConfigLoadEnd, Routes} from '@angular/router';
import { AboutComponent } from './about/about.component';

const routes: Route[] = [
  {path: '', component: HelloWord},
  {path: 'about', component: AboutComponent}
]

@NgModule({
  declarations: [
    AppComponent, 
    HelloWord, FirstComponent, UserComponent, AboutComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    RouterModule.forRoot(routes)
  ],
  providers: [DataService],
  bootstrap: [AppComponent]
})
export class AppModule { }
