import { Component } from '@angular/core';
import { Router } from '@angular/router'; // Importez Router

@Component({
  selector: 'app-dashboard',
  standalone: false,
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent {
  constructor(private router: Router) {} // Injectez Router ici

  navigateToProfile() {
    // Naviguez vers la page de profil
    this.router.navigate(['/profil']);
  }
}