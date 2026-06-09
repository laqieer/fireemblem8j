	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_804B844, 0x0804B844 + 1
	.set sub_804BA08, 0x0804BA08 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_804BA64, "ax", %progbits
@ sub_804BA64 @ JP 0x0804BA64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BA64
	.thumb_func
sub_804BA64:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0804BA88 @ =0x0300182C
	ldr r2, _0804BA8C @ =LABattleMap_IsForecastMsg
	adds r0, r4, #0
	mov r1, sp
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804BB2A
	ldrb r0, [r4]
	cmp r0, #4
	beq _0804BA90
	cmp r0, #5
	beq _0804BAD4
	b _0804BB2A
	.align 2, 0
_0804BA88: .4byte 0x0300182C
_0804BA8C: .4byte 0x0804BA4D  @ LABattleMap_IsForecastMsg
_0804BA90:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804BAB4
	ldr r0, _0804BAB0 @ =0x03001830
	ldr r0, [r0, #4]
	bl sub_807B4C8
	b _0804BABC
	.align 2, 0
_0804BAB0: .4byte 0x03001830
_0804BAB4:
	ldr r0, [r7, #0x34]
	strb r0, [r6, #0x10]
	ldr r0, [r7, #0x38]
	strb r0, [r6, #0x11]
_0804BABC:
	ldr r0, [r6, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0xc]
	bl sub_8027144
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _0804BB2A
_0804BAD4:
	ldr r5, _0804BB38 @ =0x03001810
	ldr r4, _0804BB3C @ =0x0203DD8C
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _0804BB0C
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r7, #0
	adds r3, #0x30
	adds r0, r6, #0
	movs r1, #0
	bl sub_804BA08
_0804BB0C:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0804BB24
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r4, #0
	movs r1, #1
	bl sub_804BA08
_0804BB24:
	adds r0, r7, #0
	bl sub_8002DE4
_0804BB2A:
	bl sub_804B844
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB38: .4byte 0x03001810
_0804BB3C: .4byte 0x0203DD8C

