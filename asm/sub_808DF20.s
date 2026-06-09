	.syntax unified
	.section .text.sub_808DF20, "ax", %progbits
@ sub_808DF20 @ JP 0x0808DF20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DF20
	.thumb_func
sub_808DF20:
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #5
	ble _0808DF2E
	movs r0, #5
_0808DF2E:
	adds r0, r0, r2
	strh r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0

