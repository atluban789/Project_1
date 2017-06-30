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
    
            def Wprowadzanie():
                self.imie_med = input("Wprowadź imię: ")
                self.nazwisko_med = input("Wprowadź nazwisko: ")
                self.specjalizacja = input("Podaj specjalizację: ")
                self.data_zatr_p = input("Pierwszy dzień rozpoczęcia U.o Pracę: ")
                self.data_zatr_k = input("Data zakończenia U.o P.: ")
                self.telefon = input("Podaj nr telefonu: ")
                self.sql1 = "INSERT INTO Medyk (imie_med, nazwisko_med, data_zatr_p, data_zatr_k, telefon) VALUES (%s, %s, %s, %s, %s)"
                self.cursor.execute(self.sql1,(self.imie_med, self.nazwisko_med, self.specjalizacja, self.data_zatr_p, self.data_zatr_k, self.telefon))
                self.conn.commit()
            def odczyt(self):
                self.sql = "SELECT * FROM Medyk"
                self.cursor.execute(self.sql)
                self.results = self.cursor.fetchall()
                print("%5s%10s%15s%15s%15s%15s%15s" % ("id_med","Imię","Nazwisko","Specjalizacja","Zatrudnienie_p","Zatrudnienie_k","Telefon"))
                
                for row in self.results:
                    self.id_med = row[0]
                    self.imie_med = row[1]
                    self.nazwisko_med = row[2]
                    self.data_zatr_p = row[3]
                    self.data_zatr_k = row[4]
                    self.telefon = row[5]
                    print("%5s%10s%15s%15s%15s%15s%15s" % (self.imie_med, self.nazwisko_med, self.specjalizacja, self.data_zatr_p, self.data_zatr_k, self.telefon))
                def modyfikacja(self):
                    self.id_med = input("Podaj id użytkownika do modyfikacji: ")
                    self.imie_med = input("Pdaj imię medyka: ")
                    self.nazwisko_med = input("Podaj nazwisko medyka: ")
                    self.specjalizacja = input("Podaj specjalizację: ")
                    self.data_zatr_p = input("Data rozpoczęcia współpracy: ")
                    self.data_zatr_k = input("Data zakończenia współpracy: ")
                    self.telefon = input("Podaj nr telefonu: ")
                    self.sql3 = "UPDATE Medyk SET imie_med=%s,nazwisko_med=%s where id_med=%s"
                    self.cursor.execute(self.sql3,(self.imie_med, self.nazwisko_med, self.id_med))
                    self.conn.commit()
                def usuwanie(self):
                    self.id_med = input()
                    self.potwierdzenie = input("Czy napewno chcesz usunąć?(T/N)")
                    if (self.potwierdzenie == "T"):
                        self.sql4 = "DELETE FROM Medyk WHERE id_med=%s"
                        self.cursor.execute(self.sql4,(self.id_med))
                        self.conn.commit()
                    else:
                        print("Wstrzymano usuwanie")
                def widok(self):
                    self.sql5 = "SELECT * FROM Medyk"
                    self.cursor.execute(self.sql5)
                    self.results = self.cursor.fetchall()
                    print("%15s%15s%15s" % ("Imie","Nazwisko","Specjalizacja","Telefon"))
                    for row in self.results:
                        self.imie_med = row[0]
                        self.nazwisko_med = row[1]
                        self.specjalizacja = row[2]
                        self.telefon = row[3]
                        print("%15s%15s%15s%15s" % (self.imie_med, self.nazwisko_med, self.specjalizacja, self.telefon))    
o1 = MenuLogin(input("Podaj login: "), input("Podaj hasło:"))