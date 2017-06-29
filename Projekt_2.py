# -*- coding: utf-8 -*-

import pymysql
    

class MenuLogin:
    def __init__(self):
        self.conn = pymysql.connect('localhost', 'root', 'Gabi78', 'PraktykaLekarska')
        self.cursor = self.conn.cursor()
        self.login = login
        self.haslo = haslo
        self.logowanie()
    def logownie (self):
        self.sql2 = "SELECT * FROM Uzytkownicy WHERE login = %s AND passwort = %s"
        self.cursor.execute(self.sql2,(self.login, self.haslo))
        
        if(self.cursor.rowcount == 1):
            print("Logowanie prawidłowe")
            self.i = input("Wybierz: \n (S)-select, \n(I)-insert, \n(U)-update, \n(D)-delete, \n(V)-view, \n(Q)-quit")
            if (self.i == "S"):
                self.odczyt()
                self.logowanie()
            elif(self.i == "I"):
                self.wprowadzanie()
                self.odczyt()
                self.logowanie()
            elif(self.i == "U"):
                self.odczyt()
                self.modyfikacja()
                self.odczyt()
                self.logowanie()
            elif(self.i == "D"):
                self.odczyt()
                self.usuwanie()
                self.odczyt()
                self.logowanie()
            elif(self.i == "V"):
                self.widok()
                self.logowanie()
            else:
                print("The End")
        else:
            print("Login error")
o1 = MenuLogin(input("Podaj login: "), input("Podaj hasło:"))