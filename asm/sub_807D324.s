	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_807D324, "ax", %progbits
@ CheckCanSummon @ JP 0x0807D324 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CheckCanSummon
	.thumb_func
CheckCanSummon:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
	movs r4, #0x81
	movs r5, #0x80
	lsls r5, r5, #0x11
_0807D330:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807D34E
	ldr r0, [r0]
	cmp r0, #0
	beq _0807D34E
	cmp r7, #0x27
	bgt _0807D370
	asrs r0, r5, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r5, r5, r1
	adds r7, r0, #0
_0807D34E:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807D330
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #7
	bgt _0807D370
	adds r0, r6, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt _0807D370
	movs r0, #0
	b _0807D37A
_0807D370:
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #1
_0807D37A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

