	.syntax unified
	.set StartManimLevelUp, 0x0808144C + 1
	.section .text.sub_807E554, "ax", %progbits
@ sub_807E554 @ JP 0x0807E554 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807E554
	.thumb_func
sub_807E554:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x63
	ble _0807E56E
	adds r0, r1, #0
	adds r0, #0x68
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl StartManimLevelUp
_0807E56E:
	pop {r0}
	bx r0
	.align 2, 0

