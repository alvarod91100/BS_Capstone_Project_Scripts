import os 
import datetime

path=str(os.getcwd())+'/backups/'
os.environ['montalvoinc_backup_time']=str(datetime.datetime.now())
new_path=os.path.join(path,str(os.getenv('montalvoinc_backup_time')))

os.mkdir(new_path)
os.chdir(new_path)
print(os.getcwd())
print('Iniciando backup  proyecto_salud')

os.system('mysqldump -P 3306 -h 3.14.73.75 -u monstruito --password=montalvoinc proyecto_salud > proyecto_salud.sql')
print('Backup proyecto salud finalizado')
print('Iniciando backup replica desensibilizada')

os.system('mysqldump -P 3306 -h 3.14.73.75 -u monstruito --password=montalvoinc  proyecto_salud_desensibilizada > proyecto_salud_desensibilizada.sql')
print('Backup replica desensibilizada completada')
