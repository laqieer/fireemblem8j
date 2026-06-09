	.syntax unified
	.set SetBanimArenaFlag, 0x08070EF0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80712BC, "ax", %progbits
@ sub_80712BC @ JP 0x080712BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80712BC
	.thumb_func
sub_80712BC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080712D8 @ =0x08603C04
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	bl SetBanimArenaFlag
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080712D8: .4byte 0x08603C04

