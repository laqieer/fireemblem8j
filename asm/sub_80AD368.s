	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set InitSaveMenuHelpTextSt, 0x080AF1E0 + 1
	.set sub_80A9C30, 0x080A9C30 + 1
	.set sub_80A9C44, 0x080A9C44 + 1
	.set sub_80AA1AC, 0x080AA1AC + 1
	.set sub_80ABB50, 0x080ABB50 + 1
	.section .text.sub_80AD368, "ax", %progbits
@ sub_80AD368 @ JP 0x080AD368 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD368
	.thumb_func
sub_80AD368:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x168
	adds r4, r0, #0
	bl sub_80A9C30
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AD37C
	movs r0, #0
	b _080AD3F2
_080AD37C:
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A9C44
	mov r0, sp
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	blt _080AD394
	cmp r0, #2
	ble _080AD394
	cmp r0, #3
	beq _080AD398
_080AD394:
	movs r6, #1
	b _080AD39A
_080AD398:
	movs r6, #0xf
_080AD39A:
	adds r0, r4, #0
	bl GetSaveReadAddr
	adds r7, r0, #0
	movs r5, #0
	adds r4, r7, #0
	adds r4, #0x4c
	b _080AD3AE
_080AD3AA:
	adds r4, #0x24
	adds r5, #1
_080AD3AE:
	cmp r5, #0x32
	bgt _080AD3EC
	adds r0, r4, #0
	add r1, sp, #0x4c
	bl sub_80AA1AC
	ldr r0, [sp, #0x4c]
	add r1, sp, #0x4c
	cmp r0, #0
	beq _080AD3AA
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _080AD3AA
	ldr r4, _080AD3E4 @ =0x0203EF60
	strb r6, [r4]
	ldrb r0, [r1, #8]
	strb r0, [r4, #1]
	ldr r1, _080AD3E8 @ =0x00000D8C
	adds r0, r7, r1
	add r5, sp, #0x94
	adds r1, r5, #0
	bl sub_80ABB50
	ldrb r0, [r5, #0x11]
	strb r0, [r4, #2]
	b _080AD3F0
	.align 2, 0
_080AD3E4: .4byte 0x0203EF60
_080AD3E8: .4byte 0x00000D8C
_080AD3EC:
	bl InitSaveMenuHelpTextSt
_080AD3F0:
	movs r0, #2
_080AD3F2:
	add sp, #0x168
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

