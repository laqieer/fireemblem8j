	.syntax unified
	.set SetBanimArenaFlag, 0x08070EF0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8071DF4, "ax", %progbits
@ sub_8071DF4 @ JP 0x08071DF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071DF4
	.thumb_func
sub_8071DF4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08071E10 @ =0x0860429C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	bl SetBanimArenaFlag
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071E10: .4byte 0x0860429C

