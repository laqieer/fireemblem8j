	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_End, 0x08002CBC + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_80048D8, 0x080048D8 + 1
	.set sub_809242C, 0x0809242C + 1
	.set sub_80976A0, 0x080976A0 + 1
	.section .text.sub_8093EF8, "ax", %progbits
@ sub_8093EF8 @ JP 0x08093EF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8093EF8
	.thumb_func
sub_8093EF8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08093F20
	ldr r1, _08093FA0 @ =0x0200D6E0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80976A0
	bl sub_809242C
_08093F20:
	ldr r3, _08093FA4 @ =0x0202BCEC
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x32
	lsls r0, r0, #7
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r0, [r3, #0x1a]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	cmp r2, #0
	beq _08093F4A
	lsls r2, r2, #4
	ldrb r1, [r3, #0x19]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x19]
_08093F4A:
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _08093F5A
	bl Proc_End
_08093F5A:
	bl sub_80048D8
	ldr r0, _08093FA8 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08093FAC @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08093FB0 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _08093FB4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bl ResetTextFont
	bl sub_80034D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093FA0: .4byte 0x0200D6E0
_08093FA4: .4byte 0x0202BCEC
_08093FA8: .4byte 0x02022CA8
_08093FAC: .4byte 0x020234A8
_08093FB0: .4byte 0x02023CA8
_08093FB4: .4byte 0x03003020

