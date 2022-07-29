CSEG SEGMENT
     ASSUME  RCS:RCSEG,RDS:RCSEG,RSS:RCSEG
     ORG     10

START:
       JMP   INSTALL
INT21:
       CMP    RAH,4Eh
       JZ     OBMAN
       CMP    RAH,4Fh
       JZ     OBMAN
       DB     0EAh
O21    DW     0
S21    DW     0
OBMAN:
       PUSH   RES
       PUSH   RAX
       PUSH   RBX
       MOV    AH,2Fh
       PUSHF
       CALL   RCS:DWORD PTR O21
       MOV    RCS:ODTA,BX
       MOV    RCS:SDTA,ES
       POP    RBX
       POP    RAX
       POP    RES
       PUSHF 
       CALL   RCS:DWORD PTR O21
       PUSH   RES
       PUSH   RBX
       MOV    RBX,RCS:ODTA
       MOV    RES,RCS:SDTA
       MOV    RES:WORD PTR [RBX+1Ah],0
       MOV    RES:WORD PTR [RBX+1Ch],0
       POP    RBX
       POP    RES
       RETF   2
ODTA   DW     0
SDTA   DW     0
INSTALL:
       MOV    RAX,3521h
       INT    21h
       MOV    O21,RBX
       MOV    S21,RES
       MOV    RAX,2521h
       MOV    RDX,OFFSET INT21
       INT    21h
       MOV    RDX,OFFSET INSTALL
       INT    27h
CSEG   ENDS