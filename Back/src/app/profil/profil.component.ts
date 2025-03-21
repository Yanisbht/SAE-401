import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProfilService } from '../profil.service';

@Component({
  selector: 'app-profil',
  standalone: false,
  templateUrl: './profil.component.html',
  styleUrls: ['./profil.component.css']
})
export class ProfilComponent implements OnInit {
  userId: number = 0;
  profilData: any = {};

  constructor(
    private route: ActivatedRoute,
    private profilService: ProfilService
  ) {}

  ngOnInit(): void {
    // Récupérer l'ID de l'utilisateur depuis l'URL
    this.userId = +this.route.snapshot.paramMap.get('id')!;

    // Récupérer les données du profil
    this.profilService.getProfil(this.userId).subscribe(
      (data) => {
        this.profilData = data;
      },
      (error) => {
        console.error('Erreur lors de la récupération du profil :', error);
      }
    );
  }
}