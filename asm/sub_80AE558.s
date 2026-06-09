	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80AE558, "ax", %progbits
@ sub_80AE558 @ JP 0x080AE558 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE558
	.thumb_func
sub_80AE558:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xd
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r0, #0xdc
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, #0x24
	subs r1, #0x17
	strb r0, [r1]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080AE59C
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080AE59C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

