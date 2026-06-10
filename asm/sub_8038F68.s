	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set ResetText, 0x08003BC4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80048D8, 0x080048D8 + 1
	.set sub_80B0238, 0x080B0238 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8038F68, "ax", %progbits
@ sub_8038F68 @ JP 0x08038F68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038F68
	.thumb_func
sub_8038F68:
	push {lr}
	sub sp, #4
	bl sub_80B0238
	bl sub_80048D8
	ldr r0, _08038FD4 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08038FD8 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08038FDC @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08038FE0 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _08038FE4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl ResetText
	movs r0, #0
	str r0, [sp]
	ldr r1, _08038FE8 @ =0x020228A8
	ldr r2, _08038FEC @ =0x01000100
	mov r0, sp
	bl sub_80D636C
	bl sub_8001EE4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08038FD4: .4byte 0x02022CA8
_08038FD8: .4byte 0x020234A8
_08038FDC: .4byte 0x02023CA8
_08038FE0: .4byte 0x020244A8
_08038FE4: .4byte 0x03003020
_08038FE8: .4byte 0x020228A8
_08038FEC: .4byte 0x01000100

