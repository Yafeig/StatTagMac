FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        i      	 
 	 I      �� ���� "0 managecodefiles manageCodeFiles   ��  o      ���� 0 arg  ��  ��   
 k     "       l     ��������  ��  ��        l     ��  ��     	set arg2 to arg as text     �   0 	 s e t   a r g 2   t o   a r g   a s   t e x t      l     ��  ��    L F	display dialog "Enter your text here... (" & arg & ") (" & arg2 & ")"     �   � 	 d i s p l a y   d i a l o g   " E n t e r   y o u r   t e x t   h e r e . . .   ( "   &   a r g   &   " )   ( "   &   a r g 2   &   " ) "      l     ��������  ��  ��        l     ��  ��    4 .if application "StatTagTestUI" is running then     �     \ i f   a p p l i c a t i o n   " S t a t T a g T e s t U I "   i s   r u n n i n g   t h e n   ! " ! l     �� # $��   # 
 else    $ � % %  e l s e "  & ' & l     �� ( )��   ( + %	activate application "StatTagTestUI"    ) � * * J 	 a c t i v a t e   a p p l i c a t i o n   " S t a t T a g T e s t U I " '  + , + l     �� - .��   -  
	delay 2.0    . � / /  	 d e l a y   2 . 0 ,  0 1 0 l     �� 2 3��   2  end if    3 � 4 4  e n d   i f 1  5 6 5 l     ��������  ��  ��   6  7 8 7 l     �� 9 :��   9  if appIsInstalled() then    : � ; ; 0 i f   a p p I s I n s t a l l e d ( )   t h e n 8  < = < l     �� > ?��   >  	return true    ? � @ @  	 r e t u r n   t r u e =  A B A l     �� C D��   C 
 else    D � E E  e l s e B  F G F l     �� H I��   H  	return false    I � J J  	 r e t u r n   f a l s e G  K L K l     �� M N��   M  end if    N � O O  e n d   i f L  P Q P l     ��������  ��  ��   Q  R S R I    �� T��
�� .miscactvnull��� ��� null T m      U U�                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��  ��   S  V W V l   ��������  ��  ��   W  X Y X l   ��������  ��  ��   Y  Z [ Z r     \ ] \ c    	 ^ _ ^ m    ��
�� boovfals _ m    ��
�� 
bool ] o      ���� 0 mynewresult myNewResult [  ` a ` l   ��������  ��  ��   a  b c b l   �� d e��   d b \http://apple.stackexchange.com/questions/121810/waiting-until-a-window-exists-in-applescript    e � f f � h t t p : / / a p p l e . s t a c k e x c h a n g e . c o m / q u e s t i o n s / 1 2 1 8 1 0 / w a i t i n g - u n t i l - a - w i n d o w - e x i s t s - i n - a p p l e s c r i p t c  g h g l   �� i j��   i W Qhttp://stackoverflow.com/questions/12498897/applescript-appleevent-handler-failed    j � k k � h t t p : / / s t a c k o v e r f l o w . c o m / q u e s t i o n s / 1 2 4 9 8 8 9 7 / a p p l e s c r i p t - a p p l e e v e n t - h a n d l e r - f a i l e d h  l m l l   ��������  ��  ��   m  n o n O     p q p k     r r  s t s l   ��������  ��  ��   t  u v u l    �� w x��   w � �		tell application "System Events"			if (window 1 of process "StatTagTestUI" exists) then				return "xyz"			end if		end tell		    x � y y  	 	 t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "  	 	 	 i f   ( w i n d o w   1   o f   p r o c e s s   " S t a t T a g T e s t U I "   e x i s t s )   t h e n  	 	 	 	 r e t u r n   " x y z "  	 	 	 e n d   i f  	 	 e n d   t e l l  	 	 v  z { z l   ��������  ��  ��   {  | } | l    �� ~ ��   ~ � �
		--no can do - assistive events...		tell application "System Events"			repeat until window "StatTagTestUI" of process "StatTagTestUI" exists			end repeat		end tell
		     � � �X 
 	 	 - - n o   c a n   d o   -   a s s i s t i v e   e v e n t s . . .  	 	 t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "  	 	 	 r e p e a t   u n t i l   w i n d o w   " S t a t T a g T e s t U I "   o f   p r o c e s s   " S t a t T a g T e s t U I "   e x i s t s  	 	 	 e n d   r e p e a t  	 	 e n d   t e l l 
 	 	 }  � � � l   ��������  ��  ��   �  � � � l    �� � ���   � � �		set startTime to current date		repeat until exists window 1			delay 0.2			if (current date) - startTime is greater than 10 then return -- a precaution so you don't get stuck in the repeat loop forever		end repeat		    � � � ��  	 	 s e t   s t a r t T i m e   t o   c u r r e n t   d a t e  	 	 r e p e a t   u n t i l   e x i s t s   w i n d o w   1  	 	 	 d e l a y   0 . 2  	 	 	 i f   ( c u r r e n t   d a t e )   -   s t a r t T i m e   i s   g r e a t e r   t h a n   1 0   t h e n   r e t u r n   - -   a   p r e c a u t i o n   s o   y o u   d o n ' t   g e t   s t u c k   i n   t h e   r e p e a t   l o o p   f o r e v e r  	 	 e n d   r e p e a t  	 	 �  � � � l   ��������  ��  ��   �  � � � r     � � � I   ������
�� .STMNGCFLnull��� ��� null��  ��   � o      ���� 0 mynewresult myNewResult �  � � � L     � � o    ���� 0 mynewresult myNewResult �  � � � l   �� � ���   �  tell me to log myResult    � � � � . t e l l   m e   t o   l o g   m y R e s u l t �  ��� � l   �� � ���   � &  tell me to log "inside function"    � � � � @ t e l l   m e   t o   l o g   " i n s i d e   f u n c t i o n "��   q m     � ��                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��   o  � � � l   ��������  ��  ��   �  � � � L      � � o    ���� 0 mynewresult myNewResult �  � � � l  ! !�� � ���   � ! set myResult to "x" as text    � � � � 6 s e t   m y R e s u l t   t o   " x "   a s   t e x t �  � � � l  ! !�� � ���   �  return myResult    � � � �  r e t u r n   m y R e s u l t �  ��� � l  ! !��������  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 opensettings openSettings �  ��� � o      ���� 0 arg  ��  ��   � k       � �  � � � l     ��������  ��  ��   �  � � � I    �� ���
�� .miscactvnull��� ��� null � m      � ��                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��  ��   �  � � � l   ��������  ��  ��   �  � � � r     � � � c    	 � � � m    ��
�� boovfals � m    ��
�� 
bool � o      ���� 0 mynewresult myNewResult �  � � � O     � � � k     � �  � � � r     � � � I   ������
�� .STOPNSTGnull��� ��� null��  ��   � o      ���� 0 mynewresult myNewResult �  ��� � L     � � o    ���� 0 mynewresult myNewResult��   � m     � ��                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��   �  � � � l   ��������  ��  ��   �  � � � L     � � o    ���� 0 mynewresult myNewResult �  ��� � l   ��������  ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 	openabout 	openAbout �  ��� � o      ���� 0 arg  ��  ��   � k       � �  � � � l     ��������  ��  ��   �  � � � I    �� ���
�� .miscactvnull��� ��� null � m      � ��                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��  ��   �  � � � l   ��~�}�  �~  �}   �  � � � r     � � � c    	 � � � m    �|
�| boovfals � m    �{
�{ 
bool � o      �z�z 0 mynewresult myNewResult �  � � � O     � � � k     � �  � � � r     � � � I   �y�x�w
�y .STOPNABTnull��� ��� null�x  �w   � o      �v�v 0 mynewresult myNewResult �  ��u � L     � � o    �t�t 0 mynewresult myNewResult�u   � m     � ��                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��   �  � � � l   �s�r�q�s  �r  �q   �  � � � L     � � o    �p�p 0 mynewresult myNewResult �  ��o � l   �n�m�l�n  �m  �l  �o   �  � � � l     �k�j�i�k  �j  �i   �  �  � i     I      �h�g�h 0 openhelp openHelp �f o      �e�e 0 arg  �f  �g   k        l     �d�c�b�d  �c  �b   	 I    �a
�`
�a .miscactvnull��� ��� null
 m     �                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��  �`  	  l   �_�^�]�_  �^  �]    r     c    	 m    �\
�\ boovfals m    �[
�[ 
bool o      �Z�Z 0 mynewresult myNewResult  O     k      r     I   �Y�X�W
�Y .STOPNHLPnull��� ��� null�X  �W   o      �V�V 0 mynewresult myNewResult �U L     o    �T�T 0 mynewresult myNewResult�U   m    �                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��    !  l   �S�R�Q�S  �R  �Q  ! "#" L    $$ o    �P�P 0 mynewresult myNewResult# %�O% l   �N�M�L�N  �M  �L  �O    &'& l     �K�J�I�K  �J  �I  ' ()( l     �H�G�F�H  �G  �F  ) *+* i    ,-, I      �E.�D�E 0 
managetags 
manageTags. /�C/ o      �B�B 0 arg  �C  �D  - k     300 121 l     �A�@�?�A  �@  �?  2 343 I    �>5�=
�> .miscactvnull��� ��� null5 m     66�                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��  �=  4 787 l   �<�;�:�<  �;  �:  8 9:9 r    ;<; c    	=>= o    �9�9 0 arg  > m    �8
�8 
TEXT< o      �7�7 0 arg  : ?@? r    ABA I    �6C�5�6 0 replacetext replaceTextC DED m    FF �GG  "E HIH m    JJ �KK  I L�4L o    �3�3 0 arg  �4  �5  B o      �2�2 0 arg  @ MNM l   �1OP�1  O  display dialog arg   P �QQ $ d i s p l a y   d i a l o g   a r gN RSR l   �0�/�.�0  �/  �.  S TUT r    VWV c    XYX m    �-
�- boovfalsY m    �,
�, 
boolW o      �+�+ 0 mynewresult myNewResultU Z[Z O    .\]\ k   ! -^^ _`_ l  ! !�*ab�*  a % set myNewResult to updateFields   b �cc > s e t   m y N e w R e s u l t   t o   u p d a t e F i e l d s` ded l  ! !�)fg�)  f 1 +set myNewResult to updateFields tagname arg   g �hh V s e t   m y N e w R e s u l t   t o   u p d a t e F i e l d s   t a g n a m e   a r ge iji r   ! *klk I  ! (�(�'m
�( .STTGUPDTnull��� ��� null�'  m �&n�%
�& 
tgIdn o   # $�$�$ 0 arg  �%  l o      �#�# 0 mynewresult myNewResultj o�"o L   + -pp o   + ,�!�! 0 mynewresult myNewResult�"  ] m    qq�                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��  [ rsr l  / /� ���   �  �  s tut L   / 1vv o   / 0�� 0 mynewresult myNewResultu w�w l  2 2����  �  �  �  + xyx l     ����  �  �  y z{z i    |}| I      ����  0 appisinstalled appIsInstalled�  �  } k     ~~ � e     �� n     ��� 1    �
� 
ID  � m     ���                                                                                      @ alis    8  Macintosh HD               �<*�H+  ���StatTag.app                                                    ����:"�        ����  	                Debug     �<q      �:i2    (��������x��d�n 	} 	| 3 �  �1  �Macintosh HD:Users: ewhitley: Library: Developer: Xcode: DerivedData: StatTag-cleegsqxxdlbkcb#6A59164: Build: Products: Debug: StatTag.app    S t a t T a g . a p p    M a c i n t o s h   H D  xUsers/ewhitley/Library/Developer/Xcode/DerivedData/StatTag-cleegsqxxdlbkcbhryezxamefxmw/Build/Products/Debug/StatTag.app  /    ��  � ��� Q    ���� I   ���
� .coredoexbool       obj � 5    ���
� 
capp� m   
 �� ��� & o r g . s t a t t a g . S t a t T a g
� kfrmID  �  � R      ���
� .ascrerr ****      � ****�  �  � L    �� m    �

�
 boovfals� ��	� L    �� m    �
� boovtrue�	  { ��� l     ����  �  �  � ��� i    ��� I     ���
� .sysodelanull��� ��� nmbr� o      �� 0 duration  �  � k     +�� ��� r     	��� [     ��� l    ��� � I    ������
�� .misccurdldt    ��� null��  ��  �  �   � o    ���� 0 duration  � o      ���� 0 endtime endTime� ���� V   
 +��� O   &��� I   %�����
�� .sysodelanull��� ��� nmbr� \    !��� o    ���� 0 endtime endTime� l    ������ I    ������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  � 1    ��
�� 
ascr� A   ��� l   ������ I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  � o    ���� 0 endtime endTime��  � ��� l     ��������  ��  ��  � ��� l     ������  � Q Khttp://stackoverflow.com/questions/28115085/find-and-replace-in-applescript   � ��� � h t t p : / / s t a c k o v e r f l o w . c o m / q u e s t i o n s / 2 8 1 1 5 0 8 5 / f i n d - a n d - r e p l a c e - i n - a p p l e s c r i p t� ��� i    ��� I      ������� 0 replacetext replaceText� ��� o      ���� 0 find  � ��� o      ���� 0 replace  � ���� o      ���� 0 subject  ��  ��  � k     &�� ��� r     ��� n     ��� 1    ��
�� 
txdl� 1     ��
�� 
ascr� o      ���� 0 prevtids prevTIDs� ��� r    ��� o    ���� 0 find  � n      ��� 1    
��
�� 
txdl� 1    ��
�� 
ascr� ��� r    ��� n    ��� 2   ��
�� 
citm� o    ���� 0 subject  � o      ���� 0 subject  � ��� l   ��������  ��  ��  � ��� r    ��� o    ���� 0 replace  � n      ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ��� r    ��� c    ��� o    ���� 0 subject  � m    ��
�� 
ctxt� o      ���� 0 subject  � ��� r    #��� o    ���� 0 prevtids prevTIDs� n      ��� 1     "��
�� 
txdl� 1     ��
�� 
ascr� ��� l  $ $��������  ��  ��  � ���� L   $ &�� o   $ %���� 0 subject  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  TestStatTag("")   � ���  T e s t S t a t T a g ( " " )� ��� l     ������  �  openSettings("")   � ���   o p e n S e t t i n g s ( " " )� ��� l     ������  �  manageCodeFiles("")   � ��� & m a n a g e C o d e F i l e s ( " " )� ��� l     ������  �   manageTags("macro test 2")   � ��� 4 m a n a g e T a g s ( " m a c r o   t e s t   2 " )� ��� l     �� ��     manageTags("macro test")    � 0 m a n a g e T a g s ( " m a c r o   t e s t " )�  l     ��������  ��  ��   �� l     ��������  ��  ��  ��       
��	
��   ������������������ "0 managecodefiles manageCodeFiles�� 0 opensettings openSettings�� 0 	openabout 	openAbout�� 0 openhelp openHelp�� 0 
managetags 
manageTags��  0 appisinstalled appIsInstalled
�� .sysodelanull��� ��� nmbr�� 0 replacetext replaceText �� 
�������� "0 managecodefiles manageCodeFiles�� ����   ���� 0 arg  ��   ������ 0 arg  �� 0 mynewresult myNewResult  U������
�� .miscactvnull��� ��� null
�� 
bool
�� .STMNGCFLnull��� ��� null�� #�j Of�&E�O� *j E�O�OPUO�OP �� ��������� 0 opensettings openSettings�� ����   ���� 0 arg  ��   ������ 0 arg  �� 0 mynewresult myNewResult  �������
�� .miscactvnull��� ��� null
�� 
bool
�� .STOPNSTGnull��� ��� null�� !�j Of�&E�O� *j E�O�UO�OP	 �� ��������� 0 	openabout 	openAbout�� ����   ���� 0 arg  ��   ������ 0 arg  �� 0 mynewresult myNewResult  �������
�� .miscactvnull��� ��� null
�� 
bool
�� .STOPNABTnull��� ��� null�� !�j Of�&E�O� *j E�O�UO�OP
 ���������� 0 openhelp openHelp�� ����   ���� 0 arg  ��   ������ 0 arg  �� 0 mynewresult myNewResult ������
�� .miscactvnull��� ��� null
�� 
bool
�� .STOPNHLPnull��� ��� null�� !�j Of�&E�O� *j E�O�UO�OP ��-������� 0 
managetags 
manageTags�� �~�~   �}�} 0 arg  ��   �|�{�| 0 arg  �{ 0 mynewresult myNewResult 	6�z�yFJ�x�w�v�u
�z .miscactvnull��� ��� null
�y 
TEXT�x 0 replacetext replaceText
�w 
bool
�v 
tgId
�u .STTGUPDTnull��� ��� null� 4�j O��&E�O*��m+ E�Of�&E�O� *�l E�O�UO�OP �t}�s�r�q�t  0 appisinstalled appIsInstalled�s  �r     ��p�o��n�m�l�k
�p 
ID  
�o 
capp
�n kfrmID  
�m .coredoexbool       obj �l  �k  �q ��,EO )���0j W 	X  fOe �j��i�h !�g
�j .sysodelanull��� ��� nmbr�i 0 duration  �h    �f�e�f 0 duration  �e 0 endtime endTime! �d�c�b
�d .misccurdldt    ��� null
�c 
ascr
�b .sysodelanull��� ��� nmbr�g ,*j  �E�O  h*j  �� �*j  j U[OY�� �a��`�_"#�^�a 0 replacetext replaceText�` �]$�] $  �\�[�Z�\ 0 find  �[ 0 replace  �Z 0 subject  �_  " �Y�X�W�V�Y 0 find  �X 0 replace  �W 0 subject  �V 0 prevtids prevTIDs# �U�T�S�R
�U 
ascr
�T 
txdl
�S 
citm
�R 
ctxt�^ '��,E�O���,FO��-E�O���,FO��&E�O���,FO� ascr  ��ޭ