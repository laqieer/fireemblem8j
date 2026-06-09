	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80AE508, "ax", %progbits
@ sub_80AE508 @ JP 0x080AE508 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE508
	.thumb_func
sub_80AE508:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xc
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
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	adds r1, #0x24
	subs r0, #0x17
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080AE552
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_080AE552:
	pop {r4, r5}
	pop {r0}
	bx r0

