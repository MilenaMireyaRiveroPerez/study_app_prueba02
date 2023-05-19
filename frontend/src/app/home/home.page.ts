import { Component, OnInit, inject } from '@angular/core';
import { RefresherCustomEvent } from '@ionic/angular';
import { DataService, Message } from '../services/data.service';
import axios from 'axios';

import { MessageComponent } from '../message/message.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {
  private data = inject(DataService);
  temas: any = [];
  router: any;
  //usuarios : any = [];

  constructor() {}

  refresh(ev: any) {
    setTimeout(() => {
      (ev as RefresherCustomEvent).detail.complete();
    }, 3000);
  }

  getMessages(): Message[] {
    return this.data.getMessages();
  }

  ionViewWillEnter(): void {
    this.getThemes();
  }
/////


////
  ngOnInit(): void {

  }
  
  getUsers () {
    let token = localStorage.getItem("token");

    let config ={
      headers : {
      "Authorization" : token
    }
    }
    
  }
  getThemes() {
    axios.get('http://localhost:3000/themes/list')
      .then((result) => {
        if (result.data.success == true) {
          this.temas = result.data.temas;
        } else {
          console.log(result.data.error);
        }
      })
      .catch((error) => {
        console.log(error.message);
      });
  }
}
