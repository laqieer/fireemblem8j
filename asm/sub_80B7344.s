	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B7344, "ax", %progbits
@ sub_80B7344 @ JP 0x080B7344 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7344
	.thumb_func
sub_80B7344:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080B7370 @ =0x08AAFBF4
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	strh r5, [r0]
	str r4, [r1, #0x58]
	subs r0, #0x16
	strh r2, [r0]
	cmp r6, #1
	beq _080B7380
	cmp r6, #1
	bgt _080B7374
	cmp r6, #0
	beq _080B737A
	b _080B7390
	.align 2, 0
_080B7370: .4byte 0x08AAFBF4
_080B7374:
	cmp r6, #2
	beq _080B7388
	b _080B7390
_080B737A:
	movs r0, #0x80
	str r0, [r1, #0x5c]
	b _080B738E
_080B7380:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080B738E
_080B7388:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
_080B738E:
	str r0, [r1, #0x60]
_080B7390:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

