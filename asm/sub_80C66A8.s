	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80C1E54, 0x080C1E54 + 1
	.set sub_80C6530, 0x080C6530 + 1
	.section .text.sub_80C66A8, "ax", %progbits
@ sub_80C66A8 @ JP 0x080C66A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C66A8
	.thumb_func
sub_80C66A8:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	bl sub_80C1E54
	adds r1, r4, #0
	adds r1, #0x2c
	bl sub_80C6530
	adds r1, r4, #0
	adds r1, #0x38
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C66D4
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080C66D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

