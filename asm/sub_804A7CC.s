	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8003A70, 0x08003A70 + 1
	.set sub_801569C, 0x0801569C + 1
	.section .text.sub_804A7CC, "ax", %progbits
@ sub_804A7CC @ JP 0x0804A7CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A7CC
	.thumb_func
sub_804A7CC:
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _0804A7E4 @ =0x0203DA20
	ldrb r0, [r2]
	cmp r0, #1
	bne _0804A7E8
	ldrb r0, [r2, #0xb]
	cmp r0, #1
	bne _0804A7F8
	b _0804A7EE
	.align 2, 0
_0804A7E4: .4byte 0x0203DA20
_0804A7E8:
	ldrb r0, [r2, #0xb]
	cmp r0, #2
	bne _0804A7F8
_0804A7EE:
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
	b _0804A852
_0804A7F8:
	ldr r0, _0804A80C @ =0x0203DD8C
	ldrb r2, [r0, #1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _0804A810
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _0804A852
	.align 2, 0
_0804A80C: .4byte 0x0203DD8C
_0804A810:
	ldr r0, _0804A818 @ =0x0202BCEC
	strb r2, [r0, #0xf]
	ldr r2, _0804A81C @ =0x03001810
	b _0804A822
	.align 2, 0
_0804A818: .4byte 0x0202BCEC
_0804A81C: .4byte 0x03001810
_0804A820:
	adds r1, #1
_0804A822:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A820
	ldr r4, _0804A858 @ =0x0203DD8C
	strb r1, [r4, #2]
	adds r0, r1, #1
	strb r0, [r4, #3]
	bl sub_801569C
	movs r0, #0
	adds r4, #0x2c
	movs r1, #3
_0804A83C:
	str r0, [r4, #4]
	strb r0, [r4]
	adds r4, #8
	subs r1, #1
	cmp r1, #0
	bge _0804A83C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl sub_8003A70
_0804A852:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A858: .4byte 0x0203DD8C

