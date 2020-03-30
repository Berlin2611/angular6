import { Component } from '@angular/core';

@Component({
    selector: 'hello-word',
    templateUrl: './primer.component.html',
    styleUrls: ['./primer.component.css']
})
export class HelloWord{
    title = 'Welcome to Angular';
}