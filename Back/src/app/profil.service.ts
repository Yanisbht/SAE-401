import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProfilService {
  private apiUrl = 'http://localhost/profil.php'; // URL de l'API PHP

  constructor(private http: HttpClient) {}

  getProfil(userId: number): Observable<any> {
    return this.http.get(`${this.apiUrl}?id=${userId}`);
  }
}