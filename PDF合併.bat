@echo off
rem quality �����~��
rem alaph png�z���ĪG
rem gsq ghostscript�\��
rem val1 �ܴ��q���ܼ�
rem fileinput �ɮ׿�J
rem fileouput �ɮ׿�X
rem doagain �O�_�A�Ӥ@��
:START
	echo 1.PDF��PNG
	echo 2.PDF��JPG
	echo 3.PDF�X��
	echo 4.PDF����
	echo 5.PDF���Y
	SET /P gsq=�п�J�A�Q�n���檺�\��N�X(1-4)�G
	if %gsq% == 1 GOTO Fu1
	if %gsq% == 2 SET val1=jpeg&&GOTO quality
	if %gsq% == 3 GOTO Fu2
	if %gsq% == 4 GOTO Fu3
	if %gsq% == 5 GOTO Fu4
:Fu1
	SET /P alaph=�]�wPNG�O�_�a���z���ĪG(y/N)�G
	echo %alaph%|findstr /ix "[Y]" >nul && SET val1=pngalpha
rem �Y�̭���Y(�����j�p�g)�h�]�wval1��pngalpha
	echo %alaph%|findstr /iv "[Y]" >nul && SET val1=png16m
rem �Y�̭��S��Y(�����j�p�g)�h�]�wval1��png16m
rem echo val1
:quality
	SET /P quality=�п�J��X��dpi�~�謰(�w�]300)�G
	echo %quality%|findstr /iv "[100-600]" >nul && SET quality=300
	echo %quality%
	SET /P fileinput=�п�JPDF��m(ex:C:\source.pdf)�G
	SET /P fileouput=�п�J�ɮצs�ɦ�m(ex:C:\destination.png)�G
	SET code=gs -sDEVICE=%val1% -o "%fileouput%" -r%quality% "%fileinput%"
	echo %code%
	gs -dNOPAUSE -dBATCH -dQUITE -sDEVICE=%val1% -dTextAlphaBits=4 -o "%fileouput%" -r%quality% "%fileinput%"
	pause
	SET /P doagain=�O�_�A���@���H(y/N)�G
	echo %doagain% |findstr /ix "[Y]" >nul && goto START
	echo %doagain% |findstr /iv "[Y]" >nul && exit
