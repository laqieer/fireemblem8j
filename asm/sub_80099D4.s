	.syntax unified
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002EC0, 0x08002EC0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80099D4, "ax", %progbits
@ sub_80099D4 @ JP 0x080099D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80099D4
	.thumb_func
sub_80099D4:
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080099FC @ =0x020228A8
	ldr r2, _08009A00 @ =0x01000100
	mov r0, sp
	bl sub_80D636C
	bl sub_8001EE4
	ldr r0, _08009A04 @ =EndProcIfNotMarkedB
	bl sub_8002EC0
	ldr r0, _08009A08 @ =sub_8015318
	bl SetMainUpdateRoutine
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080099FC: .4byte 0x020228A8
_08009A00: .4byte 0x01000100
_08009A04: .4byte 0x080099BD  @ EndProcIfNotMarkedB
_08009A08: .4byte 0x08015319  @ sub_8015318

