	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80088FC, 0x080088FC + 1
	.section .text.sub_80B9238, "ax", %progbits
@ sub_80B9238 @ JP 0x080B9238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9238
	.thumb_func
sub_80B9238:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80088FC
	cmp r0, #1
	beq _080B924C
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
_080B924C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

