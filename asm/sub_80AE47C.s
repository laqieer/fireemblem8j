	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80AE47C, "ax", %progbits
@ sub_80AE47C @ JP 0x080AE47C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE47C
	.thumb_func
sub_80AE47C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
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
	movs r1, #0xdc
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080AE4BC
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080AE4BC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

