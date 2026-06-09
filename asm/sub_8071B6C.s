	.syntax unified
	.set SetBanimArenaFlag, 0x08070EF0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8071B6C, "ax", %progbits
@ sub_8071B6C @ JP 0x08071B6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071B6C
	.thumb_func
sub_8071B6C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08071B8C @ =0x086040C4
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	bl SetBanimArenaFlag
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071B8C: .4byte 0x086040C4

