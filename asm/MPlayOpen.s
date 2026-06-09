	.syntax unified
	.set sub_80D525C, 0x080D525C + 1
	.section .text.MPlayOpen, "ax", %progbits
@ MPlayOpen @ JP 0x080D55B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MPlayOpen
	.thumb_func
MPlayOpen:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _080D5614
	cmp r4, #0x10
	bls _080D55C4
	movs r4, #0x10
_080D55C4:
	ldr r0, _080D561C @ =0x03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _080D5620 @ =0x68736D53
	cmp r1, r0
	bne _080D5614
	adds r0, r1, #1
	str r0, [r5]
	adds r0, r7, #0
	bl sub_80D525C
	str r6, [r7, #0x2c]
	strb r4, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	cmp r4, #0
	beq _080D55F8
	movs r1, #0
_080D55EA:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _080D55EA
_080D55F8:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _080D5608
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_080D5608:
	str r7, [r5, #0x24]
	ldr r0, _080D5624 @ =MPlayMain
	str r0, [r5, #0x20]
	ldr r0, _080D5620 @ =0x68736D53
	str r0, [r5]
	str r0, [r7, #0x34]
_080D5614:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D561C: .4byte 0x03007FF0
_080D5620: .4byte 0x68736D53
_080D5624: .4byte 0x080D4861  @ MPlayMain

