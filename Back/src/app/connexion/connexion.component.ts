import { Component } from '@angular/core';
import { Router } from '@angular/router'; // Importez Router

@Component({
  selector: 'app-connexion',
  standalone: false,
  templateUrl: './connexion.component.html',
  styleUrl: './connexion.component.css'
})
export class ConnexionComponent {
  constructor(private router: Router) {} // Injectez Router dans le constructeur

  onLogin() {
    // Logique de connexion ici
    // Après une connexion réussie, naviguez vers le tableau de bord
    this.router.navigate(['/dashboard']);
  }
}